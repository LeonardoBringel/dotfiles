-- Lua LSP
-- brew install lua-language-server
vim.lsp.config('lua_ls', {})

-- Python LSP
-- pip (or pipx) install pyright
vim.lsp.config('pyright', {})

vim.lsp.enable({ 'pyright', 'lua_ls' })
