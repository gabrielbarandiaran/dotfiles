M = {}
lvim.leader = "space"

local keymap = vim.keymap.set
local otps = { noremap = true, silent = true }

keymap("n", ";", ":")

-- Move between tabs
keymap("n", "<Tab>", ":tabnext<CR>")
keymap("n", "<S-Tab>", ":tabprevious<CR>")
