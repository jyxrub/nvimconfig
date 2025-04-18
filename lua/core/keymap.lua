local keymap = vim.keymap

keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = ture })
vim.g.mapleader = " "
keymap.set("n", "<leader>aa", ":lua print('hello')<CR>", {})

-- local wk = require("plugins.whichkey")
-- local telescope = require("plugins.telescope")

-- wk.register({
-- 	f = {
-- 		name = "Telescope",
-- 		f = { telescope.builtin.find_files, "Find_files" },
-- 		g = { telescope.builtin.live_grep, "Live_grep" },
-- 		b = {telescope.builtin.buffers, "Buffers" },
-- 		h = {  builtin.help_tags, "Help tags" },
-- 	},
-- }, { prefix = "<leader>" })
