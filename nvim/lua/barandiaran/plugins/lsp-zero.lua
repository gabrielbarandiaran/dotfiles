return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
            -- Optional

            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        local lsp_conf = require('lspconfig')
        local cmp = require('cmp')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        -- (Optional) Configure lua language server for neovim
        lsp_conf.lua_ls.setup(lsp.nvim_lua_ls())
        lsp_conf.tsserver.setup {}
        lsp_conf.rust_analyzer.setup {}

        lsp.on_attach(function(client, bufnr)
            local telescope = require('telescope.builtin')
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set('n', '<leader>lr', telescope.lsp_references, { buffer = true })
            vim.keymap.set('n', '<leader>ld', telescope.lsp_definitions, { buffer = true })
            vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', { buffer = true })
            vim.keymap.set("n", "<leader>le", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
        end)

        lsp.format_on_save({
            servers = {
                ['lua_ls'] = { 'lua' },
                ['rust_analyzer'] = { 'rust' },
            }
        })


        cmp.setup({
            mapping = {
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }
        })

        lsp.setup()
    end
}
