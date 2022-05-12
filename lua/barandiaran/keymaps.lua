local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---------- GENERAL ----------

-- Update vim configuration
keymap("n", "<leader>rec", ":source $HOME/.config/nvim/init.lua<CR>", opts)

-- Improve command key
keymap("n", ";", ":", { noremap = true, silent = false })
keymap("v", ";", ":", { noremap = true, silent = false })

-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("n", "<Tab>", ":NvimTreeToggle<CR>", opts)

---------- TAB MANAGEMENT ----------

-- Move between tabs
keymap("n", "<C-Right>", ":tabprevious<CR>", opts)
keymap("n", "<C-Left>", ":tabnext<CR>", opts)

-- Move between split tabs
keymap("n", "<up>", "<C-w><up>", opts)
keymap("n", "<down>", "<C-w><down>", opts)
keymap("n", "<left>", "<C-w><left>", opts)
keymap("n", "<right>", "<C-w><right>", opts)

---------- TEXT MANIPULATION ----------

-- Yank all
keymap("n", "<leader>ya", ":%y+<CR>", opts)

-- Paste last thing you yanked, not deleted
keymap("n", "<leader>p", '"0p', opts)
keymap("n", "<leader>P", '"0p', opts)

-- Moving text
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)
keymap("i", "<C-j>", "<esc>:m .+1<CR>==", opts)
keymap("i", "<C-k>", "<esc>:m .-2<CR>==", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '>-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

---------- PLUGINS ----------

-- LSP
keymap("n", "<C-Space>", ":lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<C-d>", ":lua vim.lsp.buf.rename()<CR>")

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>tg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>td", ":Telescope diagnostics<CR>", opts)

-- Tagbar
keymap("n", "<F8>", ":TagbarToggle<CR>", opts)

