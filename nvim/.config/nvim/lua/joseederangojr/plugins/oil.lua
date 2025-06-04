return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return name == ".git"
        end,
      },
      delete_to_trash = true,
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["gv"] = { "actions.select", opts = { vertical = true } },
        ["gh"] = { "actions.select", opts = { horizontal = true } },
        ["gt"] = { "actions.select", opts = { tab = true } },
        ["gp"] = "actions.preview",
        ["gc"] = { "actions.close", mode = "n" },
        ["gr"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      },
    })
    local map = vim.keymap.set
    map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    map("n", "_", "<CMD>Oil .<CR>", { desc = "Open project root" })
  end,
}
