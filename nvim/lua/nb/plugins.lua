return require('packer').startup(function(use)

  -- Packer itself, otherwise it will be removed by PackerSync
  use{'wbthomason/packer.nvim'}

  -- Colorschemes
  use{'marko-cerovac/material.nvim'}
  use{'rose-pine/neovim', as = 'rose-pine'}
  
  -- Utils plugin  required for other plugins
  use {'nvim-lua/popup.nvim'}

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use{'nvim-telescope/telescope-media-files.nvim'}

  -- Treesitter for word coloring
  use{'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

  -- Snippet engine, problably required for automcompletion
  use{'L3MON4D3/LuaSnip'}

  -- cmp plugins
  use{'hrsh7th/nvim-cmp'}-- The completion plugin
  use{'hrsh7th/cmp-buffer'} -- buffer completions
  use{'hrsh7th/cmp-path'} -- path completions
  use{'hrsh7th/cmp-cmdline'} -- cmdline completions
  use{'saadparwaiz1/cmp_luasnip'} -- snippet completions

end)
