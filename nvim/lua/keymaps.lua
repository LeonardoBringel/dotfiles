-- leader key
vim.g.mapleader = " "

-- shortcuts to w, q, x
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Center the screen on the next/prev search result with n/N
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev result (centered)" })

-- Center the screen when navigating bottom/up
vim.keymap.set("n", "{", "{zzzv", { desc = "Prev paragraph (centered)" })
vim.keymap.set("n", "}", "}zzzv", { desc = "Next paragraph (centered)" })

-- unhilight
vim.keymap.set("n", "<leader>h", "<cmd>noh<cr>", { desc = "Clear search highlight" })

-- move a blocks of text up/down with K/J in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
