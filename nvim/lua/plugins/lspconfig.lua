return {
  'neovim/nvim-lspconfig',
  
  -- Autostart lua_ls server
  config = function()
    require('lspconfig').sumneko_lua.setup {
      cmd = { 'lua-language-server' },
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }
  end

}
