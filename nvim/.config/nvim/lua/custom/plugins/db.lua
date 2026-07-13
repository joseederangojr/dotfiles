return {
  'zongben/dbout.nvim',
  build = 'npm install',
  lazy = 'VeryLazy',
  cmd = { 'Dbout' },
  keys = {
    { '<leader>do', '<cmd>Dbout OpenConnection<cr>', desc = '+[D]atabase [O]pen' },
  },
  config = function()
    require('dbout').setup {
      -- Set empty string to disable keymap.
      keymaps = {
        global = {
          toggle_inspector = '<F12>',
          toggle_viewer = '<F11>',
          close = 'q',
        },
        queryer = {
          query = '<F6>',
          format = '<F9>',
        },
        inspector = {
          next_tab = 'L',
          previous_tab = 'H',
          inspect = 'I',
          back = '<BS>',
          refresh = 'R',
        },
        viewer = {
          next_history = '}',
          previous_history = '{',
          delete_history = '<c-x>',
        },
      },
    }
  end,
}
