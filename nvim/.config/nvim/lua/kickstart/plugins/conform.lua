return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { { 'biome', 'prettierd', 'prettier' } },
        typescript = { { 'biome', 'prettierd', 'prettier' } },
        javascriptreact = { { 'biome', 'prettierd', 'prettier' } },
        typescriptreact = { { 'biome', 'prettierd', 'prettier' } },
        json = { { 'biome', 'jq' } },
        markdown = { { 'prettierd', 'prettier' } },
        html = { 'htmlbeautifier' },
        bash = { 'beautysh' },
        yaml = { 'yamlfix' },
        toml = { 'taplo' },
        css = { { 'prettierd', 'prettier' } },
        scss = { { 'prettierd', 'prettier' } },
        php = { { 'prettierd', 'prettier' }, { './vendor/bin/pint', 'pint' } },
        sql = { 'sql-formatter' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
