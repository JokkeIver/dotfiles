return { 
  "IogaMaster/tuxedo.nvim",
  config = function()
    require('tuxedo').setup {
      create_todo_file = true,
      width_ratio = 0.95,
      height_ratio = 0.80,
    }
  end,
}
