return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      require('catppuccin').setup {
        no_italic = true,
        flavour = 'mocha',
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          notify = true,
        },
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
