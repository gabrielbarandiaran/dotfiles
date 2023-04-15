vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("n", ";", ":")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("i", "(<Space>", "()<Left>")
keymap("i", "(;", "(<CR>);<C-c>O")
keymap("i", "(,", "(<CR>),<C-c>O")
keymap("i", "{<Space>", "{}<Left>")
keymap("i", "{;", "{<CR>};<C-c>O")
keymap("i", "{,", "{<CR>};<C-c>O")
keymap("i", "[<Space>", "[]<Left>")
keymap("i", "[;", "[<CR>];<C-c>O")
keymap("i", "[,", "[<CR>],<C-c>O")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<A-k>", "<cmd>cnext<CR>zz")
keymap("n", "<A-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
