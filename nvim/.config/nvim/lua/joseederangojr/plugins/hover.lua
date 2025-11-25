return {
  {
    "lewis6991/hover.nvim",
    config = function()
      local hover = require("hover")

      hover.config({
        --- List of modules names to load as providers.
        --- @type (string|Hover.Config.Provider)[]
        providers = {
          "hover.providers.lsp",
          -- "hover.providers.diagnostic",
          -- "hover.providers.dap",
          -- "hover.providers.man",
          -- "hover.providers.dictionary",
          -- "hover.providers.gh",
          -- "hover.providers.gh_user",
          -- "hover.providers.jira",
          -- "hover.providers.fold_preview",
          -- "hover.providers.highlight",
        },
        preview_opts = {
          border = "single",
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
        mouse_providers = {
          "hover.providers.lsp",
        },
        mouse_delay = 1000,
      })
      local set = vim.keymap.set

      set("n", "K", hover.open)
      set("n", "gK", hover.enter, {
        desc = "Hover enter buffer",
      })
      set("n", "gk", hover.close, {
        desc = "Hover close buffer",
      })
      set("n", "<MouseMove>", hover.mouse, {
        desc = "Hover Mouse Move",
      })
    end,
  },
}
