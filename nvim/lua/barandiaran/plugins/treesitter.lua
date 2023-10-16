return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufEnter",
	build = "TSUpdate",
	dependencies = {
		{ "p00f/nvim-ts-rainbow" },
		{ "windwp/nvim-ts-autotag" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			ensure_installed = {
				"rust",
				"rust",
				"typescript",
				"json5",
				"git_config",
				"gitcommit",
				"gitignore",
				"html",
				"css",
				"scss",
				"javascript",
				"markdown",
				"lua",
				"yaml",
				"svelte",
				"tsx",
				"regex",
				"python",
			},
			rainbow = {
				enable = true,
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
