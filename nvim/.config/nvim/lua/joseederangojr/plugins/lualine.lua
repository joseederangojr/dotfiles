return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", { "catppuccin/nvim", name = "catppuccin" } },
    config = function()
      local theme = require("catppuccin.utils.lualine")("mocha")
      require("lualine").setup({
        options = {
          theme = theme,
          section_separators = "",
          component_separators = "",
          sections = {
            lualine_z = {
              {
                require("opencode").statusline,
              },
            },
          },
        },
      })
    end,
  },
}
