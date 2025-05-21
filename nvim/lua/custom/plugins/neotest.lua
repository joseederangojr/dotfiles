return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'V13Axel/neotest-pest',
    },
    config = function()
      local neotest = require 'neotest'
      neotest.setup {
        adapters = {
          require 'neotest-pest',
        },
      }

      vim.keymap.set('n', '<leader>tn', neotest.run.run, { desc = 'Run [t]est [n]earest' })
      vim.keymap.set('n', '<leader>tc', function()
        require('neotest').run.run(vim.fn.expand '%')
      end, { desc = 'Run [t]est [c]urrent file' })
      vim.keymap.set('n', '<leader>ts', neotest.run.stop, { desc = 'Run [t]est [s]top' })
      vim.keymap.set('n', '<leader>ta', neotest.run.stop, { desc = 'Run [t]est [a]ttach' })
      vim.keymap.set('n', '<leader>td', neotest.run.stop, { desc = 'Run [t]est [d]ebug' })
    end,
  },
}
