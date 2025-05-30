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
      local map = vim.keymap.set
      map("n", "<leader>tn", require("neotest").run.run, { desc = "Run [t]est [n]earest" })
      map("n", "<leader>tc", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run [t]est [c]urrent file" })
      map("n", "<leader>ts", require("neotest").run.stop, { desc = "Run [t]est [s]top" })
      map("n", "<leader>ta", require("neotest").run.stop, { desc = "Run [t]est [a]ttach" })
      map("n", "<leader>td", require("neotest").run.stop, { desc = "Run [t]est [d]ebug" })
    end,
  },
}
