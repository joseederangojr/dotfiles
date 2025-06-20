return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "V13Axel/neotest-pest",
      "marilari88/neotest-vitest",
      "olimorris/neotest-phpunit",
    },
    requires = {
      "nvim-neotest/neotest-jest",
      "arthur944/neotest-bun",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-phpunit"),
          require("neotest-jest"),
          require("neotest-bun"),
          require("neotest-pest"),
        },
      })

      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = "Run [T]est" .. desc })
      end
      map("n", "<leader>tn", require("neotest").run.run, "[N]earest")
      map("n", "<leader>tc", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run [t]est [c]urrent file" })
    end,
  },
}
