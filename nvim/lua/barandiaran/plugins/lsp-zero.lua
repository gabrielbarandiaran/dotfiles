return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{
			-- Optional

			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Formatting
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "jay-babu/mason-null-ls.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional
		{ "L3MON4D3/LuaSnip" }, -- Require
		{ "rafamadriz/friendly-snippets" }, -- Optionald
	},
	config = function()
		local lsp = require("lsp-zero").preset({
			name = "minimal",
			set_lsp_keymaps = false,
			manage_nvim_cmp = true,
			suggest_lsp_servers = false,
		})
		local lsp_conf = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-- KEYMAPS
		lsp.on_attach(function(client, bufnr)
			local telescope = require("telescope.builtin")
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>lr", telescope.lsp_references, { buffer = true })
			vim.keymap.set("n", "<leader>ld", telescope.lsp_definitions, { buffer = true })
			vim.keymap.set("n", "<leader>le", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "<leader>la", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>ln", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("n", "<leader>lf", function()
				vim.lsp.buf.format()
			end, opts)
		end)

		-- LSP Configurations
		lsp.ensure_installed({
			"tsserver",
			"rust_analyzer",
			"lua_ls",
			"svelte",
		})
		lsp_conf.tsserver.setup({
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})
		lsp_conf.rust_analyzer.setup({})
		lsp_conf.lua_ls.setup({})
		lsp_conf.svelte.setup({})

		-- Format on Save
		lsp.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["null-ls"] = { "javascript", "typescript", "lua", "typescriptreact", "svelte", "rust" },
			},
		})

		-- CMP Configurations
		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
			},
		})

		mason.setup()
		mason_lspconfig.setup()
		lsp.setup()

		-- Linting & Formating
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		mason_null_ls.setup({
			ensure_installed = { "prittierd", "eslint_d", "stylua", "rustfmt" },
			automatic_installation = false,
			automatic_setup = true,
		})
		local null_opts = lsp.build_options("null-ls", {})
		null_ls.setup({
			on_attach = function(client, bufnr)
				null_opts.on_attach(client, bufnr)
			end,
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rustfmt,
			},
		})
	end,
}
