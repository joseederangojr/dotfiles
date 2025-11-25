return {
  {
    "folke/zen-mode.nvim",
    dependencies = {
      {
        "folke/twilight.nvim",
        opts = {},
      },
    },
    opts = {
      window = {
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        twilight = { enabled = false },
        tmux = { enabled = true },
        kitty = { enabled = true },
      },
    },
    config = function(_, opts)
      require("zen-mode").setup(opts)
      vim.keymap.set({ "n", "v", "i", "x" }, "<leader>tz", "<cmd>ZenMode<CR>", { desc = "[T]oggle [Z]enMode" })
    end,
  },
}
