return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '_', '<CMD>Oil .<CR>', { desc = 'Open project root' })
    local actions = require 'oil.actions'
    require('oil').setup {
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          -- return name == 'vendor' or name == 'node_modules' or name == '.git'
          return name == '.git'
        end,
      },
      delete_to_trash = true,
      use_default_keymaps = false,
      keymaps = {
        ['<CR>'] = 'actions.select',
        ['gx'] = 'actions.refresh',
        ['gs'] = { 'actions.change_sort', mode = 'n' },
      },
    }
  end,
}
