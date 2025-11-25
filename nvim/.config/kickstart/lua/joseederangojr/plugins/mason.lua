if true then
  return {}
end

return {

  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- LSP
      "intelephense",

      "html-lsp",
      "emmet-language-server",
      "css-lsp",

      "yaml-language-server",
      "json-lsp",
      "lua-language-server",
      "docker-language-server",

      "tsp-server",

      -- Formatter
      "pint",
      "php-cs-fixer",
      "biome",
      "prettierd",
      "sqruff",
      "stylua",
      -- Linter

      "phpstan",
      "phpcs",
      "htmlhint",
      "stylelint",
      "eslint_d",
      "jsonlint",
      "yamllint",
      "hadolint",
      "selene",

      -- Debugger
      "js-debug-adapter",
      "php-debug-adapter",
    },
  },
  config = function(_, opts)
    local mason = require("mason")
    mason.setup({})

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      local packages = table.concat(opts.ensure_installed, " ")
      vim.cmd("MasonInstall " .. packages)
    end, {})
  end,
}
