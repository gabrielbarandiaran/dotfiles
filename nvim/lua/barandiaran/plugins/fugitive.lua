return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>gg", ":Git<CR>")
        vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
        vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
    end
}
