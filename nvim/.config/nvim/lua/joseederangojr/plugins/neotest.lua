return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "V13Axel/neotest-pest",
      "marilari88/neotest-vitest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-pest"),
          require("neotest-vitest"),
        },
      })
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = "Run [T]est" .. desc })
      end
      map("n", "<leader>tn", require("neotest").run.run, "[N]earest")
      map("n", "<leader>tc", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, "[C]urrent file")
    end,
  },
}
