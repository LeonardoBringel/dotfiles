vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover' }))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'References' }))
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = 'Signature help' }))
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename' }))
    vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend('force', opts, { desc = 'Format' }))
    vim.keymap.set('n', '<leader>xx', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
  end,
})

local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})
