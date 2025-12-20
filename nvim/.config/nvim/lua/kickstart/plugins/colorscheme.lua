return {
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'soft'
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_disable_italic_comment = 0
      vim.g.everforest_transparent_background = 0
      vim.g.everforest_dim_inactive_windows = 1
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'everforest'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
