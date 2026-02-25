-- disable unnecessary dependencies
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1

require("keymaps")
require("options")
require("plugins.lazy")
require("plugins_keymaps")
require("plugins_options")
require("lsp")
