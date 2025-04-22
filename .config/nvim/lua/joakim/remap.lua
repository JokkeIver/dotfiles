vim.g.mapleader = " "
vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)
-- Map double <Esc> to remove search highlight
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Open Neotree

