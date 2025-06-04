return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      editor = {
        -- mappings for the buffer
        mappings = {
          -- run what's currently selected on the active connection
          { key = "<CR>", mode = "v", action = "run_selection" },
          -- run the whole file on the active connection
          { key = "<CR>", mode = "n", action = "run_file" },
        },
      },
    },
    build = function()
      require("dbee").install("go")
    end,
  },
}
