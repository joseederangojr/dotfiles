return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      vim.keymap.set({ "n", "x" }, "s", "<Nop>")
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
      require("mini.pairs").setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
