return {
  'stevearc/oil.nvim',
  init = function()
    vim.keymap.set('n', '<BS>', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    require('oil').setup {
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return name == 'vendor' or name == 'node_modules' or name == '.git'
        end,
      },
      delete_to_trash = true,
      keymaps = {
        ['<C-v>'] = 'actions.select_vsplit',
        ['<C-h>'] = 'actions.select_split',
        ['t'] = 'actions.select_tab',
        ['w'] = 'actions.preview',
        ['q'] = 'actions.close',
        ['r'] = 'actions.refresh',
        ['<BS>'] = 'actions.parent',
      },
    }
  end,
}
