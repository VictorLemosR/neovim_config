--https://github.com/astral-sh/ruff-lsp/issues/384
-- Ajeitar o ruff-lsp para funcionar com o pyright
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        --         build = function()
        --             pcall(vim.cmd, 'MasonUpdate')
        --         end,
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local lsp_capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright", -- (python lsp) one of the primary mainteners of the lsp client is fan of it
                "ruff",
                "lua_ls", --(only lua lsp)
            },
            handlers = {
                function(server_name)
                    if server_name ~= "rust_analyzer" then
                        require("lspconfig")[server_name].setup({
                            capabilities = lsp_capabilities,
                        })
                    end
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "require" },
                                },
                            },
                        },
                    })
                end,
                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        -- Other Configs ...
                        settings = {
                            ["rust-analyzer"] = {
                                -- Other Settings ...
                                procMacro = {
                                    ignored = {
                                        leptos_macro = {
                                            -- optional: --
                                            -- "component",
                                            "server",
                                        },
                                    },
                                },
                                rustfmt = {
                                    overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
                                },
                            },
                        },
                    })
                end,
            },
        })

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                --["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                --["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", max_item_count = 15 },
                { name = "luasnip" },
                --{ name = "path" }, --Disliked. Showed so many options, if I understood right
                --{ name = "buffer", keyword_length = 3 }, --Disliked. Showed so many options
                --{ name = "luasnip", keyword_length = 2 },
            }, {
                { name = "buffer" },
            }),
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.lsp
        vim.keymap.set("n", KEYS.open_float, vim.diagnostic.open_float)
        vim.keymap.set("n", KEYS.go_to_prev, vim.diagnostic.goto_prev)
        vim.keymap.set("n", KEYS.go_to_next, vim.diagnostic.goto_next)
        -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist) -- open diagnostic in float

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                --Also copy these lines to rustaceanvim.lua
                local opts = { buffer = ev.buf }
                local remaps_plugins = require("victor.hotkeys_plugins")
                local KEYS = remaps_plugins.lsp

                vim.keymap.set("n", KEYS.go_to_definition, vim.lsp.buf.definition, opts)
                vim.keymap.set("n", KEYS.hover, vim.lsp.buf.hover, opts)
                --vim.keymap.set("n", KEYS.workspace_symbol,
                --vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", KEYS.code_action, vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", KEYS.references, vim.lsp.buf.references, opts)
                vim.keymap.set("n", KEYS.rename, vim.lsp.buf.rename, opts)
                vim.keymap.set("i", KEYS.signature_help, vim.lsp.buf.signature_help, opts)
            end,
        })
    end,
}
