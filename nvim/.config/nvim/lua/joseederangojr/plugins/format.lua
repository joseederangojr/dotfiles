return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      {
        "zapling/mason-conform.nvim",
        opts = {
          ensure_installed = {
            "biome",
            "prettierd",
            "jq",
            "shfmt",
            "yq",
            "sqruff",
            "pint",
            "stylua",
          },
        },
      },
    },
    lazy = false,
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 750,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        javascript = { "biome", "prettierd", stop_after_first = true },
        typescript = { "biome", "prettierd", stop_after_first = true },
        javascriptreact = { "biome", "prettierd", stop_after_first = true },
        typescriptreact = { "biome", "prettierd", stop_after_first = true },
        json = { "jq" },
        jsonc = { "jq" },
        html = { "prettierd" },
        bash = { "shfmt" },
        yaml = { "prettierd" },
        toml = { "yq" },
        css = { "prettierd", stop_after_first = true },
        scss = { "prettierd", stop_after_first = true },
        php = { "prettierd", "pint" },
        sql = { "sqruff" },
        lua = { "stylua" },
      },
      --@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer)
      formatters = {},
    },
    config = function(_, opts)
      require("conform").setup(opts)
      vim.keymap.set({ "v", "n", "i" }, "<leader>bf", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "[B]uffer [F]ormat" })
    end,
  },
}
