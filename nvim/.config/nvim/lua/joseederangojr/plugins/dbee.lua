return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install("go")
    end,
    config = function()
      local dbee = require("dbee")
      dbee.setup({
        editor = {
          -- mappings for the buffer
          mappings = {
            -- run what's currently selected on the active connection
            { key = "<CR>", mode = "v", action = "run_selection" },
            -- run the whole file on the active connection
            { key = "<CR>", mode = "n", action = "run_file" },
          },
        },
      })
    end,
  },

  { -- to load dbee database connection
    "ellisonleao/dotenv.nvim",
    init = function()
      require("dotenv").setup({
        enable_on_load = true,
        verbose = false,
        file_name = ".env.dbee",
      })
    end,
  },
}
