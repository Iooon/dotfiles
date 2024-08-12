return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
    },
    keys = {
        { '<leader>rn', function() vim.lsp.buf.rename() end,
            { desc = '[R]e[n]ame' }
        },
        { '<leader>ca', function() vim.lsp.buf.code_action() end,
            { desc = '[C]ode [A]ction' }
        },
        { 'gd', function() vim.lsp.buf.definition() end,
            { desc = '[G]oto [D]efinition' }
        },
        { 'gr', function() require('telescope.builtin').lsp_references() end,
            { desc = '[G]oto [R]eferences' }
        },
        { 'gI', function() vim.lsp.buf.implementation() end,
            { desc = '[G]oto [I]mplementation' }
        },
        { 'gD', function() vim.lsp.buf.declaration() end,
            { desc = '[G]oto [D]eclaration' }
        },
        { '<leader>D', function() vim.lsp.buf.type_definition() end,
            { desc = 'Type [D]efinition' }
        },
        { '<leader>ds', function() require('telescope.builtin').lsp_document_symbols() end,
            { desc = '[D]ocument [S]ymbols' }
        },
        { '<leader>ws', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end,
            { desc = '[W]orkspace [S]ymbols' }
        },
        { '<leader>=', function() vim.lsp.buf.format() end,
            { desc = 'Format current file' }
        },
        -- See `:help K` for why this keymap
        { 'K', function() vim.lsp.buf.hover() end,
            { desc = 'Hover Documentation' }
        },
        { '<C-h>', function() vim.lsp.buf.signature_help() end,
            { desc = 'Signature Help' }
        },
        { '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end,
            { desc = '[W]orkspace [A]dd Folder' }
        },
        { '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end,
            { desc = '[W]orkspace [R]emove Folder' }
        },
        { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            { desc = '[W]orkspace [L]ist Folders' }
        },

        { ':A', '<cmd>ClangdSwitchSourceHeader<cr>',
            { desc = 'Switch between source/header in C/C++' }
        },
    },

    config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<cr>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = nil,
                ['<S-Tab>'] = nil,
            }),
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "pyright",
            },
        })

        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                nvim_lsp["lua_ls"].setup({
                    capabilities = capabilities,
                })
            end,
            ["clangd"] = function()
                nvim_lsp["clangd"].setup({
                    capabilities = capabilities,
                })
            end,
            ["rust_analyzer"] = function()
                nvim_lsp["rust_analyzer"].setup({
                    capabilities = capabilities,
                })
            end,
            ["pyright"] = function()
                nvim_lsp["pyright"].setup({
                    capabilities = capabilities,
                })
            end,
        })
    end,
}
