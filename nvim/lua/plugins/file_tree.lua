return {
  "nvim-tree/nvim-tree.lua",
  version="*",
  lazy=false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
      api.map.on_attach.default(bufnr)

      -- unused defaults, disabled per user request
      vim.keymap.del("n", "g?", { buffer = bufnr })
      vim.keymap.del("n", "<C-v>", { buffer = bufnr })
      vim.keymap.del("n", "<C-x>", { buffer = bufnr })
    end

    require("nvim-tree").setup {
      on_attach = on_attach,
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      }
    }
  end
}

