return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup {
        settings = { save_on_toggle = true, sync_on_ui_close = true },
      }

      vim.keymap.set('n', '<leader>H', function()
        harpoon:list():add()
      end, { desc = '[H]arpoon' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set('n', '<F1>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<F2>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<F3>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<F4>', function()
        harpoon:list():select(4)
      end)

      vim.keymap.set('n', '<F5>', function()
        harpoon:list():select(5)
      end)
    end,
  },
}
