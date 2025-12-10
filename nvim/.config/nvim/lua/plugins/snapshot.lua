return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  keys = function()
    local silicon = require("nvim-silicon")
    return {
      {
        "<leader>cx",
        function()
          silicon.shoot()
        end,
        mode = "v",
        desc = "Code Snapshot (Silicon)",
      },
    }
  end,
  opts = {
    disable_defaults = true,
    background = "#313244",
    font = "Maple Mono NF CN",
    theme = "mocha",
    to_clipboard = true,
    output = nil,
    command = "silicon",
    language = function()
      return vim.bo.filetype or vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":e")
    end,
    window_title = function()
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
    end,
  },
}
