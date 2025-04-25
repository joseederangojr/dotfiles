return {
  {
    'ellisonleao/dotenv.nvim',
    init = function()
      require('dotenv').setup {
        enable_on_load = true,
        verbose = false,
        file_name = '.env.db',
      }
    end,
  },
}
