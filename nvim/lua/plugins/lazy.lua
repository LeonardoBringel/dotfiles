-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- automatically check for plugin updates
  checker = { enabled = true },
  require("plugins.telescope"),
  require("plugins.file_tree"),
  require("plugins.toggle_comment"),
  require("plugins.auto_pairs"),
  require("plugins.highlighted_yank"),
  require("plugins.git_blame"),
  require("plugins.lsp_completion_engine"),
  require("plugins.lsp_completion_source"),
  require("plugins.lsp_config")
})
