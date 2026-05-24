return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = {
			flavour = "latte",
			transparent_background = false,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		opts = {
			variant = "dawn",
			dark_variant = "main",
			dim_inactive_windows = false,
		},
	},
}
