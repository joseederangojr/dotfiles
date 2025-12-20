return {
  'nvim-treesitter/nvim-treesitter',
  version = false, -- Last release is way too old
  build = ':TSUpdate',
  lazy = false, -- Keep false to ensure loading for Neo-tree
  main = 'nvim-treesitter.configs', -- Lazy handles the require logic here
  branch = 'master', -- Explicitly force the stable branch
  opts = {
    ensure_installed = {
      'bash',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'javascript',
      'typescript',
      'php',
      'json',
      'json5',
      'yaml',
      'http',
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  -- Fallback config to handle edge cases
  config = function(_, opts)
    -- Protective call: If treesitter fails to load, don't crash neovim
    local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
    if not status_ok then
      return
    end
    configs.setup(opts)
  end,
}
-- vim: ts=2 sts=2 sw=2 et
