return {
  { "NvChad/nvim-colorizer.lua",

  config = function()
    require 'colorizer'.setup {
      filetypes = {
        '*',
        html = { mode = 'foreground'; }
      },
      user_default_options = { mode = "background", },
    }
  end
  }
}
