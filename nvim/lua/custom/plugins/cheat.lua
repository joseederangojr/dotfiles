return {
  { 'RishabhRD/popfix' },
  {
    'RishabhRD/nvim-cheat.sh',
    config = function()
      vim.keymap.set('n', '<leader>cs', '<CMD>Cheat<CR>', { desc = 'Open [c]heat[s]heet' })
      vim.keymap.set('n', '<leader>cl', '<CMD>CheatList<CR>', { desc = 'Open [c]heatsheet [l]ist ' })
    end,
  },
}
