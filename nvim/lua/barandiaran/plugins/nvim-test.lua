return {
	"klen/nvim-test",
	config = function()
		require("nvim-test").setup({})

		vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>")
		vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
	end,
}
