return {
  "nvim-telescope/telescope.nvim",
  version="*",
  dependencies={ "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          -- unused defaults, disabled per user request
          i = {
            ["<M-q>"] = false, -- send_selected_to_qflist (OPTION + q)
            ["<C-/>"] = false, -- which_key
            ["<C-_>"] = false, -- which_key, alternate spelling of the same combo
          },
          n = {
            ["<M-q>"] = false, -- send_selected_to_qflist (OPTION + q)
          },
        },
      },
    })
  end,
}
