return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
	},
	cmd = "Telescope",
	event = false,
	keys = {
		{
			"<leader>/",
			"<cmd>Telescope find_files<CR>",
			desc = "Grep (Root Dir)",
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<CR>",
			desc = "Live grep (Root Dir)",
		},
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
}
