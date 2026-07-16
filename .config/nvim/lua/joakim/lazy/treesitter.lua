return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- explicitly install the parsers you want if they are not already installed
    local ensure_installed = {
      "go", "sql", "bash", "java", "svelte", "html", "css",
      "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline",
    }
    local installed = require("nvim-treesitter").get_installed()
    local to_install = {}
    for _, parser in ipairs(ensure_installed) do
      if not vim.tbl_contains(installed, parser) then
        table.insert(to_install, parser)
      end
    end
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    -- enable highlighting per-buffer
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end
}
