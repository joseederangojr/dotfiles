return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim',
    'folke/snacks.nvim',
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>g', desc = '+[G]it' },
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit UI' },
  },
}
