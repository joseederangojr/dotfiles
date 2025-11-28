return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
        args = {},
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Run current file",
          port = 9003,
          cwd = "${workspaceFolder}",
          args = "${file}",
          runtimeExecutable = "php",
        },
        {
          type = "php",
          request = "launch",
          name = "Artisan",
          port = 9003,
          cwd = "${workspaceFolder}",
          program = "artisan",
          runtimeExecutable = "php",
          env = { XDEBUG_TRIGGER = "1" },
          args = function()
            return vim.split(vim.fn.input("php artisan ", "", "file"), " ")
          end,
        },
        {
          type = "php",
          request = "launch",
          name = "Pest / PHPUnit",
          port = 9003,
          cwd = "${workspaceFolder}",
          program = "vendor/bin/pest",
          args = { "${file}" },
          env = { XDEBUG_TRIGGER = "1" },
        },
      }
    end,
  },
}
