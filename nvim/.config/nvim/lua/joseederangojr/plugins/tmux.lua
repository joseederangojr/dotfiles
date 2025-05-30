return {
  {
    "alexghergh/nvim-tmux-navigation",
    opts = {},
    config = function()
      require("nvim-tmux-navigation").setup({})
      local map = vim.keymap.set
      map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "nvim tmux navigate [h]left" })
      map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "nvim tmux navigate [j]down" })
      map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "nvim tmux navigate [k]up" })
      map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "nvim tmux navigate [l]right" })
    end,
  },
}
