vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover' }))
    -- shows the first place where a symbol is defined
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
    -- shows the type (interface/class/typedef) of a symbol
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))
    -- shows all references of a symbol
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'References' }))
    -- shows info about a function’s parameters
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = 'Signature help' }))
    -- rename all references of a symbol
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename' }))
    -- execute auto format
    vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend('force', opts, { desc = 'Format' }))
    -- execute quick fix based on lsp
    vim.keymap.set('n', '<leader>xx', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
  end,
})

