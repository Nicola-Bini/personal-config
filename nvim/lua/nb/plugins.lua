local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

packer = require('packer')
local use = packer.use

packer.init({
    opt_default = false, -- Default to using opt (as opposed to start) plugins)
    display = {
      open_fn  = require('packer.util').float, -- An optional function to open a window for packer's display
      working_sym = '⟳', -- The symbol for a plugin being installed/updated
      error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
      done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
      removed_sym = '-', -- The symbol for an unused plugin which was removed
      moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
      header_sym = '━', -- The symbol for the header line in packer's display
      show_all_info = true, -- Should packer show all update details automatically? prompt_border = 'double', -- Border style of prompt popups. }
    }
  }
)


packer.reset()
packer.startup(function()
  use {
    'wbthomason/packer.nvim',
    opt = false

  }
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}

  -- Fuzzy finder
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
  use {'nvim-telescope/telescope-media-files.nvim'}


    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
  -- Snippet engine
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}

  -- autocompletion
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/nvim-cmp'}

  -- Some snippets to test
  use {'rafamadriz/friendly-snippets'}

  -- Prettier
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  
  -- colorscheme
  use {'marko-cerovac/material.nvim'}
  use({'rose-pine/neovim', as = 'rose-pine'})
  
  -- Help with key bindings
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  } 

  if packer_bootstrap then
    require('packer').sync()
  end
end)


