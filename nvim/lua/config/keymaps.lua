-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move lines / selections: Option+u = up, Option+i = down.
-- LazyVim's own <A-j>/<A-k> never arrive: AeroSpace grabs alt-j/k globally for
-- window focus. Same commands as LazyVim's, on keys AeroSpace leaves alone.
-- (Inside Telescope / snacks pickers, <A-i> keeps its picker meaning:
-- "include ignored files". Those mappings are local to the picker.)
local map = vim.keymap.set
map("n", "<A-i>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-u>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-i>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-u>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-i>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-u>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
