-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'nelstrom/vim-visual-star-search' },
  { 'jessarcher/vim-heritage' },
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = { 'kana/vim-textobj-user' },
  },
  {
    'airblade/vim-rooter',
    setup = function()
      -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
      vim.g.rooter_manual_only = 1
    end,
    config = function()
      vim.cmd 'Rooter'
    end,
  },
}
