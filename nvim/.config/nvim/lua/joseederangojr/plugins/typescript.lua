return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      setttings = {
        separate_diagnostic_server = false,
      },
    },
  },
}
