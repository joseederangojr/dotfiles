return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup({
        settings = { save_on_toggle = true, sync_on_ui_close = true },
      })

      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end, { desc = "[H]arpoon [A]dd Buffer" })
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<C-A-Q>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-A-W>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-A-E>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-A-R>", function()
        harpoon:list():select(4)
      end)

      vim.keymap.set("n", "<C-A-T>", function()
        harpoon:list():select(4)
      end)

      vim.keymap.set("n", "<C-A-X>", function()
        harpoon:list():remove_at(vim.fn.line("."))
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-A-P>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<C-A-N>", function()
        harpoon:list():next()
      end)
    end,
  },
}
