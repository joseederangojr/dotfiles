return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        return name == ".git"
      end,
    },
    delete_to_trash = true,
    use_default_keymaps = false,
    keymaps = {
      ["<CR>"] = "actions.select",
      ["gx"] = "actions.refresh",
      ["gs"] = { "actions.change_sort", mode = "n" },
    },
  },
  config = function(_, opts)
    require('oil').setup(opts)
    local map = vim.keymap.set
    map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    map("n", "_", "<CMD>Oil .<CR>", { desc = "Open project root" })
  end
}
