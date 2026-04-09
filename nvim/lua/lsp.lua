-- Pass cmp capabilities to all servers
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- brew install lua-language-server
vim.lsp.config('lua_ls', {})

-- brew install pyright
vim.lsp.config('pyright', {})

vim.lsp.enable({ 'lua_ls', 'pyright' })

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
