return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      require('github-theme').setup {}

      vim.cmd 'colorscheme github_dark_dimmed'
      local detect_colorscheme = function()
        vim.fn.jobstart('defaults read -g AppleInterfaceStyle', {
          on_stdout = function()
            vim.cmd 'colorscheme github_dark_dimmed'
          end,
          on_stderr = function()
            vim.cmd 'colorscheme github_light'
          end,
        })
      end

      vim.keymap.set('n', '<leader>tt', detect_colorscheme, { desc = '[T]oggle colorscheme [t]heme' })
    end,
  },
}
