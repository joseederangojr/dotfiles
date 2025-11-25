-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Highlight on search, but clear on pressing <Esc> in normal mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })
map("n", "<C-M-h>", "<C-W>5<", { desc = "Resize pane width to right" })
map("n", "<C-M-l>", "<C-W>5>", { desc = "Resize pane widht to left" })
map("n", "<C-M-j>", "<C-W>-", { desc = "Resize pane decrease height" })
map("n", "<C-M-k>", "<C-W>+", { desc = "Resize pane increase height" })
map("v", "<", "<gv", { desc = "Reselect visual selection after indenting to right" })
map("v", ">", ">gv", { desc = "Reselect visual selection after indenting to left" })
map("v", "y", "myy`y", { desc = "Maintain the cursor position when yanking a visual selection" })
map("n", "q:", ":q", { desc = "Disable annoying command line typo" })
map("v", "p", '"_dP', { desc = "Paste replace visual selection without copying it" })
map("i", "<A-k>", "<Esc>:move .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-j>", "<Esc>:move .+1<CR>==gi", { desc = "Move line down" })
map("n", "<A-j>", ":move .+1<CR>==", { desc = "Move line up" })
map("n", "<A-k>", ":move .-2<CR>==", { desc = "Move line down" })
map("v", "<A-j>", ":move '>+1<CR>gv=gv", { desc = "Move line up" })
map("v", "<A-k>", ":move '<-2<CR>gv=gv", { desc = "Move line down" })
map("n", "<C-d>", "<C-d>zz", { desc = "Center after jump down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Center after jumo up" })
map("n", "J", "mzJ`z", { desc = "Fix line joins" })
map("n", "n", "nzzzv", { desc = "Center next highlight search" })
map("n", "N", "Nzzzv", { desc = "Center previous highlight search" })
-- vim: ts=2 sts=2 sw=2 et
