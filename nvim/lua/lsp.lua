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
vim.lsp.config('pyright', {
  -- use the project's uv-managed .venv when one exists, so hints/completions
  -- reflect packages installed via `uv add` without needing manual activation
  on_init = function(client)
    local root = client.config.root_dir
    if root and vim.fn.isdirectory(root .. '/.venv') == 1 then
      -- must mutate client.settings (not client.config.settings): the
      -- workspace/configuration handler in vim.lsp.handlers reads from
      -- client.settings, which is copied from config.settings once at
      -- client creation and never resynced afterwards
      client.settings = vim.tbl_deep_extend('force', client.settings or {}, {
        python = {
          -- venvPath/venv is what pyright's import resolver actually reads;
          -- pythonPath alone (legacy, vscode-python-extension oriented) isn't
          -- reliable for third-party package resolution outside of vscode
          pythonPath = root .. '/.venv/bin/python',
          venvPath = root,
          venv = '.venv',
        },
      })
      client:notify('workspace/didChangeConfiguration', { settings = client.settings })
    end
  end,
})

vim.lsp.enable({ 'lua_ls', 'pyright' })

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
