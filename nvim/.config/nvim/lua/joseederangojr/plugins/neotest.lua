-- return {
--   {
--     "nvim-neotest/neotest",
--     enabled = false,
--     dependencies = {
--       "nvim-neotest/nvim-nio",
--       "nvim-lua/plenary.nvim",
--       "antoinemadec/FixCursorHold.nvim",
--       "nvim-treesitter/nvim-treesitter",
--       "V13Axel/neotest-pest",
--       -- "marilari88/neotest-vitest",
--       -- "olimorris/neotest-phpunit",
--       -- "nvim-neotest/neotest-jest",
--       -- "arthur944/neotest-bun",
--     },
--     opts = {
--       adapters = {
--         -- require("neotest-vitest"),
--         -- require("neotest-phpunit"),
--         -- require("neotest-jest"),
--         -- require("neotest-bun"),
--         require("neotest-pest")({
--           parallel = math.min(16, vim.loop.cpu_info() and #vim.loop.cpu_info() or 4), -- Dynamic parallelism
--         }),
--       },
--     },
--     config = function(_, opts)
--       local neotest = require("neotest")
--       neotest.setup(opts)
--
--       local map = function(mode, lhs, rhs, desc)
--         vim.keymap.set(mode, lhs, rhs, { desc = "Test: " .. desc })
--       end
--       map("n", "<leader>tn", neotest.run.run, "Run Nearest")
--       map("n", "<leader>tc", function()
--         neotest.run.run(vim.fn.expand("%"))
--       end, "Run Current File")
--     end,
--   },
-- }
return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/nvim-nio", "V13Axel/neotest-pest" },
  opts = {
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = {
      "neotest-pest",
    },
    -- Example for loading neotest-golang with a custom config
    -- adapters = {
    --   ["neotest-golang"] = {
    --     go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
    --     dap_go_enabled = true,
    --   },
    -- },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    },
  },
  config = function(_, opts)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Replace newline and tab characters with space for more compact diagnostics
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    if LazyVim.has("trouble.nvim") then
      opts.consumers = opts.consumers or {}
      -- Refresh and auto close trouble after running tests
      ---@type neotest.Consumer
      opts.consumers.trouble = function(client)
        client.listeners.results = function(adapter_id, results, partial)
          if partial then
            return
          end
          local tree = assert(client:get_position(nil, { adapter = adapter_id }))

          local failed = 0
          for pos_id, result in pairs(results) do
            if result.status == "failed" and tree:get_key(pos_id) then
              failed = failed + 1
            end
          end
          vim.schedule(function()
            local trouble = require("trouble")
            if trouble.is_open() then
              trouble.refresh()
              if failed == 0 then
                trouble.close()
              end
            end
          end)
          return {}
        end
      end
    end

    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        if type(name) == "number" then
          if type(config) == "string" then
            config = require(config)
          end
          adapters[#adapters + 1] = config
        elseif config ~= false then
          local adapter = require(name)
          if type(config) == "table" and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif adapter.adapter then
              adapter.adapter(config)
              adapter = adapter.adapter
            elseif meta and meta.__call then
              adapter = adapter(config)
            else
              error("Adapter " .. name .. " does not support setup")
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    require("neotest").setup(opts)
  end,
  -- stylua: ignore
  keys = {
    {"<leader>t", "", desc = "+test"},
    -- { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to Test (Neotest)" },
    { "<leader>tc", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
    -- { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files (Neotest)" },
    { "<leader>tn", function() require("neotest").run.run() end, desc = "Run Nearest (Neotest)" },
    -- { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last (Neotest)" },
    -- { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
    -- { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
    -- { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
    -- { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop (Neotest)" },
    -- { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch (Neotest)" },
  },
}
