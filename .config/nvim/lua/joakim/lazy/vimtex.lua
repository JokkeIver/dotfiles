return{
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_method = 'latexmk'

    -- Enable inverse search with Skim
    vim.g.vimtex_view_general_viewer = 'skim'
    vim.g.vimtex_view_general_options = '-r @line @pdf @tex'
    vim.g.vimtex_lsp_enabled = 0

    vim.g.vimtex_quickfix_mode = 0
  end
}
