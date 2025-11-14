return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")

    ui.setup()

    local set = function(mode, key, handler, desc)
      vim.keymap.set(mode, key, handler, {
        desc = "[D]ebugger " .. desc,
      })
    end

    require("nvim-dap-virtual-text").setup({
      display_callback = function(variable)
        if #variable.value > 15 then
          return " " .. string.sub(variable.value, 1, 15) .. "... "
        end

        return " " .. variable.value
      end,
    })

    set("n", "<leader>dt", dap.toggle_breakpoint, "[T]oggle")
    set("n", "<leader>dc", dap.continue, "[C]ontinue")

    set("n", "<leader>du", dap.run_to_cursor, "Run to C[u]rsor")

    -- Eval var under cursor
    set("n", "<space>de", function()
      require("dapui").eval(nil, { enter = true })
    end, "[E]valuate")

    set("n", "<leader>di", dap.step_into, "Step [I]nto")
    set("n", "<leader>do", dap.step_over, "Step [O]ver")
    set("n", "<leader>dt", dap.step_out, "Step Ou[t]")
    set("n", "<leader>db", dap.step_back, "Step [B]ack")
    set("n", "<leader>dr", dap.restart, "[R]estart")

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end

    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { "/path/to/vscode-php-debug/out/phpDebug.js" },
    }

    dap.configurations.php = {
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
      },
    }
  end,
}
