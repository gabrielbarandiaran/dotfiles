return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            view = {
                width = 70,
                number = true,
                relativenumber = true
            }
        }

        vim.keymap.set("n", "<S-q>", ":NvimTreeToggle<CR>")
        vim.keymap.set("n", "<S-f>", ":NvimTreeFindFile<CR>")
    end,
}
