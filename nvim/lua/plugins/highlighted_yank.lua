return {
  "machakann/vim-highlightedyank",
  event = "TextYankPost",
  config = function()
    vim.cmd [[
      hi HighlightedyankRegion cterm=reverse gui=reverse
      let g:highlightedyank_highlight_duration = 300
    ]]
  end,
}
