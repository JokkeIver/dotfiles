vim.g.mapleader = " "
vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)
-- Map double <Esc> to remove search highlight
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

--Comments.lua──────────────────────────────────────────────────────────────────────
-- Titles
vim.keymap.set({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", {  noremap = true, silent = true })
-- Named parts
vim.keymap.set({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", {  noremap = true, silent = true })
-- Simple line
vim.keymap.set("n", "<Leader>cl", "<Cmd>CBline<CR>", {  noremap = true, silent = true })
-- vim.keymap.set("i", "<M-l>", "<Cmd>CBline<CR>", {  noremap = true, silent = true }) -- To use in Insert Mode
-- Marked comments
vim.keymap.set({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", {  noremap = true, silent = true })
-- Removing a box is simple enough with the command (CBd), but if you
-- use it a lot:
vim.keymap.set({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", {  noremap = true, silent = true })

