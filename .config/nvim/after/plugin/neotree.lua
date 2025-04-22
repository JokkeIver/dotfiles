require("neo-tree").setup({
  window = {
    position = "right",
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = true,
      hide_by_name = {
        ".DS_Store",
      },
      hide_gitignore = false,
    },
    always_show = {
      ".env",
    },
  },
})
vim.keymap.set('n', '<leader>b', function()
  vim.cmd("Neotree focus")
end, { desc = "Focus Neo-tree" })
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then -- No file provided
      require("neo-tree.command").execute({ action = "show", source = "filesystem", position = "right" })
    end
  end
})
