return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    init = function()
      require("catppuccin").setup({
        flavour = "auto",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        default_integrations = true,
        integrations = {
          harpoon = true,
          mason = true,
          mini = true,
          neotest = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
          lsp_trouble = true,
          dadbod_ui = true,
          which_key = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
