local keymap = vim.keymap

keymap.set({"n", "i"}, "<C-z>", "<Cmd>undo<CR>", { silent = ture })
vim.g.mapleader = " "
keymap.set("n", "<leader>aa", ":lua print('hello')<CR>", {})
