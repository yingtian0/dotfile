-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle left<cr>", {
  desc = "Explorer Neo-tree",
  silent = true,
})

-- Move between windows with Ctrl+h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
