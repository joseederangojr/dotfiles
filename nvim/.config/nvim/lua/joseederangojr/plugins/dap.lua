return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "mxsdev/nvim-dap-vscode-js",
  },
  config = function()
  local dap = require("dap")
local ui = require("dapui")
local dvt = require("nvim-dap-virtual-text")
local dapjs = require("dap-vscode-js")
dap.set_log_level("DEBUG")
ui.setup()
dvt.setup({
  display_callback = function(variable)
    if #variable.value > 15 then
      return " " .. string.sub(variable.value, 1, 15) .. "... "
    end

    return " " .. variable.value
  end,
})

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

dapjs.setup({
  debugger_cmd = { "js-debug-adapter" },
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
  dap.configurations[language] = {
    -- Debug single pwa-node.js file
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch current file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
    -- Debug with tsx (ts-pwa-node alternative, very fast)
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch with tsx",
      runtimeExecutable = "npx",
      runtimeArgs = { "tsx" },
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    -- Attach to running pwa-node process
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    -- Debug Jest tests
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./pwa-node_modules/jest/bin/jest.js",
        "--runInBand",
        "--coverage",
        "--testLocationInResults",
      },
      program = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
    },

    -- === Chrome / Edge debugging (frontend, React, Next.js, etc.) ===
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome",
      url = "http://localhost:3000", -- change to your dev server
      webRoot = "${workspaceFolder}",
      userDataDir = false, -- reuse your profile if you want
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach to Chrome",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }
end

local set = function(mode, key, handler, desc)
  vim.keymap.set(mode, key, handler, {
    desc = "[D]ebugger " .. desc,
  })
end

set("n", "<leader>d<space>", dap.toggle_breakpoint, "[T]oggle")
set("n", "<leader>d<cr>", dap.continue, "[C]ontinue")

set("n", "<leader>du", dap.run_to_cursor, "Run to C[u]rsor")

-- Eval var under cursor
set("n", "<space>de", function()
  require("dapui").eval(nil, { enter = true })
end, "[E]valuate")

set("n", "<leader>di", dap.step_into, "Step [I]nto")
set("n", "<leader>do", dap.step_over, "Step O[v]er")
set("n", "<leader>dO", dap.step_out, "Step [O]ut")
set("n", "<leader>db", dap.step_back, "Step [B]ack")
set("n", "<leader>dr", dap.restart, "[R]estart")
  end
}
