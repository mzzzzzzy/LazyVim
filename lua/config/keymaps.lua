-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local add = vim.keymap.set

add("i", "<C-h>", "<Left>", { desc = "Move cursor left", remap = true })
add("i", "<C-j>", "<Down>", { desc = "Move cursor down", remap = true })
add("i", "<C-k>", "<Up>", { desc = "Move cursor up", remap = true })
add("i", "<C-l>", "<Right>", { desc = "Move cursor right", remap = true })
