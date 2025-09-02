-- Toggle Trouble
vim.keymap.set("n", "<leader>xx", "Trouble diagnostics toggle", { desc = "Toggle Trouble" })

-- Toggle Trouble for workspace diagnostics
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace diagnostics" })

-- Trouble for quickfix
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix list" })
