return {
  {
    "lima1909/resty.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>rr", ":Resty run<CR>", { desc = "[R]esty [R]un request under the cursor" })
      vim.keymap.set({ "n", "v" }, "<leader>rl", ":Resty last<CR>", { desc = "[R]esty Run [L]ast request" })
      vim.keymap.set({ "n", "v" }, "<leader>rf", ":Resty favorite<CR>", { desc = "[R]esty view [F]avorites" })
    end,
  },
}
