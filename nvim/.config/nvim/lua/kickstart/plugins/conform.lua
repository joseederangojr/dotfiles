return {
  { -- Autoformat
    'stevearc/conform.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'pint',
            'php-cs-fixer',
            'prettierd',
            'biome',
            'stylua',
            'easy-coding-standard',
          },
          automatic_installation = true,
          quiet_mode = true,
        },
      },
    },
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>bf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = 'n',
        desc = '[B]uffer [F]ormat',
      },
    },
    opts = {
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        php = { 'pint', 'php-cs-fixer', stop_after_first = true },
        javascript = { 'biome', 'prettierd', stop_after_first = true },
        typescript = { 'biome', 'prettierd', stop_after_first = true },
        json = { 'prettierd', stop_after_first = true },
        html = { 'prettierd' },
      },
      formatters = {
        pint = {
          require_cwd = true,
        },
        biome = {
          require_cwd = true,
        },
        ['easy-coding-standard'] = {
          require_cwd = true,
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
