local g = vim.g
local o = vim.o
local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.tabstop = 2
opt.smartindent = true
opt.shiftwidth = 2
opt.expandtab = true
