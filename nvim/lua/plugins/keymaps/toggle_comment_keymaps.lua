-- normal mode: no range needed, CommentToggle defaults to the current line
vim.keymap.set("n", "<leader>/", "<cmd>CommentToggle<cr>", { desc = "Toggle comment" })

-- visual mode: must go through `:` (not `<Cmd>`) so Neovim auto-prepends the
-- visual selection's '<,'> range to the command line. `<Cmd>...<CR>` skips
-- that step entirely, so CommentToggle silently fell back to its default
-- range (current line only) and multi-line selections toggled just one line.
vim.keymap.set("v", "<leader>/", ":CommentToggle<cr>", { desc = "Toggle comment" })
