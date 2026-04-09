return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
  },
}
