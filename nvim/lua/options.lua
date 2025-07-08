-- Enable clipboard between Vim/Neovim and other applications
vim.opt.clipboard = 'unnamedplus'

-- Modify the auto-complete menu to behave more like an IDE
vim.opt.completeopt = {'noinsert', 'menuone', 'noselect'}

-- Hide unused buffers
vim.opt.hidden = true

-- Enable auto-indentation for new lines
vim.opt.autoindent = true

-- Show replacements in a split screen
vim.opt.inccommand = 'split'

-- Set line numbers (both absolute and relative)
vim.opt.number = true
vim.opt.relativenumber = true

-- Change the split screen behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show the file title in the editor
vim.opt.title = true

-- Enable the advanced command-line menu
vim.opt.wildmenu = true

-- Enable filetype-specific plugins and auto-indentation
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable spell checking
vim.opt.spell = true

-- Speed up scrolling
vim.opt.ttyfast = true

-- Set directory for swap files
vim.opt.directory = '.'

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set the number of spaces per indentation level
vim.opt.shiftwidth = 2

-- Set the number of spaces when pressing the Tab key
vim.opt.tabstop = 2

-- Keep indentation consistent when using automatic indentation
vim.opt.softtabstop = 2

-- This should make your Vim / Neovim background transparent
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- Reserve a space in the gutter. This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Disable swap files
vim.opt.swapfile = false
