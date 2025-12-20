return {
  {
    'mrjones2014/smart-splits.nvim',
    lazy = true,
    priority = 1000,
    opts = {},
    keys = function()
      local ss = require 'smart-splits'
      return {
        { '<C-A-h>', ss.resize_left, desc = 'Resize left' },
        { '<C-A-j>', ss.resize_down, desc = 'Resize down' },
        { '<C-A-k>', ss.resize_up, desc = 'Resize up' },
        { '<C-A-l>', ss.resize_right, desc = 'Resize right' },

        { '<C-h>', ss.move_cursor_left, desc = 'Move cursor left', noremap = true },
        { '<C-j>', ss.move_cursor_down, desc = 'Move cursor down', noremap = true },
        { '<C-k>', ss.move_cursor_up, desc = 'Move cursor up', noremap = true },
        { '<C-l>', ss.move_cursor_right, desc = 'Move cursor right', noremap = true },
      }
    end,
  },
}
