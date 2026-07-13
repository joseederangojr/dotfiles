return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.g.everforest_background = 'medium'
      vim.cmd.colorscheme 'everforest'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
