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
    keys = {
      {
        "<leader>tn",
        "<cmd>Neotest run<CR>",
        desc = "Run [T]est [N]earest",
      },
      {
        "<leader>tc",
        "<cmd>Neotest run file<CR>",
        desc = "Run [T]est current [F]ile",
      },
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
    end,
  },
}
