return {
  {
    "folke/twilight.nvim",
    opts = {},
    config = function()
      vim.keymap.set({ "n", "v", "i" }, "<leader>tw", "<cmd>Twilight<CR>", { desc = "[T]oggle T[w]ighlight" })
    end,
  },
}
