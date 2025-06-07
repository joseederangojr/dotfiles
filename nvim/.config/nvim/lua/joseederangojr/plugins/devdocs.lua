return {
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      dir_path = os.getenv("HOME") .. "/.local/share/devdocs",
      after_open = function(bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", {})
      end,
    },
    keys = {
      {
        "<leader>sD",
        "<cmd>DevdocsOpen<CR>",
        desc = "[S]earch [D]evdocs",
      },
    },
  },
}
