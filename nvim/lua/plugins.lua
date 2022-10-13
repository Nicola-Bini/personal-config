packer = require('packer')

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
})

local use = packer.use
packer.reset()
packer.startup(function()
  use {
    'wbthomason/packer.nvim',
    opt = false

  }
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0'
  }

  -- Snippet engine (required for cmp)
  use {'L3MON4D3/LuaSnip'}

  -- Cmp plugin (autocompletion)
  use { 'hrsh7th/nvim-cmp'}
  use { 'hrsh7th/cmp-buffer'}
  use { 'hrsh7th/cmp-path'}
  use { 'hrsh7th/cmp-cmdline'}

  use{'martinsione/darkplus.nvim'}
end)
