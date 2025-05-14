return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>fb',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat [b]uffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 750,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        json = { 'biome', 'jq', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'htmlbeautifier' },
        bash = { 'beautysh' },
        yaml = { 'yamlfmt' },
        yml = { 'yamlfmt' },
        toml = { 'taplo' },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        scss = { 'prettierd', 'prettier', stop_after_first = true },
        php = { 'prettierd', 'prettier', 'pint' },
        sql = { 'sqruff', 'sql-formatter' },
        python = { 'black' },
      },
      --@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer)
      formatters = {},
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
