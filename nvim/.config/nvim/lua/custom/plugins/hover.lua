return {
  'lewis6991/hover.nvim',
  opts = {
    --- List of modules names to load as providers.
    --- @type (string|Hover.Config.Provider)[]
    providers = {
      'hover.providers.lsp',
    },
    preview_opts = {
      border = 'single',
    },
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = false,
    title = true,
    mouse_providers = {
      'hover.providers.lsp',
    },
    mouse_delay = 1000,
  },
  keys = {
    {
      'K',
      function()
        require('hover').open()
      end,
      desc = 'Hover',
    },
  },
}
