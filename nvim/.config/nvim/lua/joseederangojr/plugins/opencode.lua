return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()`, and required for `toggle()` — otherwise optional
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`
    }

    -- Required for `opts.auto_reload`
    vim.opt.autoread = true

    -- Recommended/example keymaps
    vim.keymap.set("n", "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "[O]pencode [T]oggle embedded" })
    vim.keymap.set("n", "<leader>oa", function()
      require("opencode").ask("@cursor: ", { submit = true })
    end, { desc = "[O]pencode [A]sk under cursor" })
    vim.keymap.set("v", "<leader>oa", function()
      require("opencode").ask("@selection: ", { submit = true })
    end, { desc = "[O]pencode [A]sk about selection" })
    vim.keymap.set("n", "<leader>ob", function()
      require("opencode").prompt("@buffer", { append = true })
    end, { desc = "[O]opencode Add [b]uffer to prompt" })
    vim.keymap.set("v", "<leader>os", function()
      require("opencode").prompt("@selection", { append = true })
    end, { desc = "[O]pencode Add [s]election to prompt" })
    vim.keymap.set("n", "<leader>oe", function()
      require("opencode").prompt("Explain @cursor and its context")
    end, { desc = "[O]pencode [E]xplain under cursor" })
    vim.keymap.set("n", "<leader>on", function()
      require("opencode").command("session_new")
    end, { desc = "[O]pencode [N]ew session" })
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("messages_half_page_up")
    end, { desc = "Messages half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("messages_half_page_down")
    end, { desc = "Messages half page down" })
    vim.keymap.set({ "n", "v" }, "<leader>op", function()
      require("opencode").select()
    end, { desc = "[O]pencode [p]rompt" })
  end,
}
