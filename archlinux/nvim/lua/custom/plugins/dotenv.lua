return {
  {
    'ellisonleao/dotenv.nvim',
    init = function()
      require('dotenv').setup {
        enable_on_load = true,
        verbose = true,
        file_name = '.env.db',
      }
    end,
  },
}
