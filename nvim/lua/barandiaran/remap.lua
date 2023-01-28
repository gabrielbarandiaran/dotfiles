local keymap = vim.keymap.set
vim.g.mapleader = " "

keymap("n", ";", ":")
keymap("n", "<leader>pv", vim.cmd.Ex)

-- Move text in visual mode (up/down)
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Move between split panes 
keymap("n", "<Up>", ":wincmd k<CR>")
keymap("n", "<Down>", ":wincmd j<CR>")
keymap("n", "<Left>", ":wincmd h<CR>")
keymap("n", "<Right>", ":wincmd l<CR>")

-- Move between tabs 
keymap("n", "<C-l>", ":tabnext<CR>")
keymap("n", "<C-j>", ":tabprevious<CR>")

-- Makes cursor stay in the middle (page jump/search jump)
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- You can paste over selected word without replacing register
keymap("x", "<leader>p", [["_dP]])

-- Yanks to system clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- Delete without adding to register
keymap({ "n", "v" }, "<leader>d", [["_d]])


-- Disable Q
keymap("n", "Q", "<nop>")
-- Switch between tmux session 
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap("n", "<leader>f", vim.lsp.buf.format)

keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace current word
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
