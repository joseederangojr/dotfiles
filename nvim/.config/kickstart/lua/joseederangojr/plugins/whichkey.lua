return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("which-key").setup()

      require("which-key").add({
        { "<leader>l", group = "[L]SP" },
        { "<leader>l_", hidden = true },
        { "<leader>s", group = "[S]earch" },
        { "<leader>s_", hidden = true },
        { "<leader>t", group = "[T]est or [T]oggle" },
        { "<leader>t_", hidden = true },
        { "<leader>r", group = "[R]est" },
        { "<leader>r_", hidden = true },
        { "<leader>a", group = "[A]vante" },
        { "<leader>a_", hidden = true },
        { "<leader>h", group = "[H]arpoon" },
        { "<leader>h_", hidden = true },
        { "<leader>x", group = "[T]rouble" },
        { "<leader>x_", hidden = true },
        { "<leader>d", group = "[D]ebugger" },
        { "<leader>d_", hidden = true },
        { "<leader>o", group = "[O]pencode" },
        { "<leader>o_", hidden = true },
        { "<leader>b", group = "[B]uffer" },
        { "<leader>b_", hidden = true },
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
