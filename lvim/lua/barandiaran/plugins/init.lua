-- Additional Plugins
lvim.plugins = {
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "karb94/neoscroll.nvim",
  "j-hui/fidget.nvim", --  Show LSP progress
  "TimUntersberger/neogit",
  "windwp/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "ThePrimeagen/harpoon",
  "psliwka/vim-smoothie",
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  "NvChad/nvim-colorizer.lua",
  "ghillb/cybu.nvim",    -- CYcle BUffer, buffer helper
  "moll/vim-bbye",
  "windwp/nvim-spectre", -- Find and replace tool
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  "kevinhwang91/nvim-bqf", -- Improve quickfix window
  "ggandor/leap.nvim",
  "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "mfussenegger/nvim-dap-python",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  "petertriho/nvim-scrollbar",
  {
    'epwalsh/obsidian.nvim',
    dependencies = { 'preservim/vim-markdown', 'godlygeek/tabular' }
  },
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
  },
  "jinh0/eyeliner.nvim",
}

require "barandiaran.plugins.bqf"
require "barandiaran.plugins.colorizer"
require "barandiaran.plugins.cybu"
require "barandiaran.plugins.eyeliner"
require "barandiaran.plugins.fidget"
require "barandiaran.plugins.git"
require "barandiaran.plugins.harpoon"
require "barandiaran.plugins.lualine"
require "barandiaran.plugins.neoscroll"
require "barandiaran.plugins.obsidian"
require "barandiaran.plugins.scrollbar"
require "barandiaran.plugins.spectre"
require "barandiaran.plugins.surround"
require "barandiaran.plugins.telescope"
require "barandiaran.plugins.treesitter"
require "barandiaran.plugins.zen-mode"
require "barandiaran.plugins.which-key"
