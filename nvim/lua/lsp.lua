-- Pass cmp capabilities to all servers
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- brew install lua-language-server
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
})

-- brew install pyright
vim.lsp.config('pyright', {})

vim.lsp.enable({ 'lua_ls', 'pyright' })

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
