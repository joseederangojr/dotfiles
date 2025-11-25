return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      search = {
        mode = "fuzzy",
      },
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "fw",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
}
