return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		-- Enable autotag for these filetypes
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"xml",
			"markdown",
		},
		-- Skip tags (don't auto-close these)
		skip_tags = {
			"area",
			"base",
			"br",
			"col",
			"command",
			"embed",
			"hr",
			"img",
			"input",
			"keygen",
			"link",
			"meta",
			"param",
			"source",
			"track",
			"wbr",
			"menuitem",
		},
	},
}
