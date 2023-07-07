local lsp = require("lsp-zero").preset("recommended")

-- LSPs for mason to install
lsp.ensure_installed({
    "pyright", -- (python lsp) one of the primary mainteners of the lsp client is fan of it
    "lua_ls", --(only lua lsp)
})

-- Tools for mason to install. Linters and formatters should be configured on null-ls after
require("mason-tool-installer").setup({
    ensure_installed = {
        --    {'debugpy', auto_update = true}, -- (python debugger) only one by the time I made the config (06/23)
        { "ruff", auto_update = true }, -- (python  linter) way faster than the others, coded in rust, lots of stars in git
        { "black", auto_update = true }, -- (python formatter) - Black gives you speed, determinism. You will save time and mental energy for more important matters.lua-language-server, -- (only lua LSP)
        { "selene", auto_update = true }, -- (Lua linter) written in rust
        { "stylua", auto_update = true }, -- (lua formatter)
    },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
})
cmp.setup({
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
        { name = "neorg" },
    },
})

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.setup_servers({'lua_ls', 'pyright'})
-- (Optional) Configure lua language server for neovim
-- require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr}
    local remaps_plugins = require("victor.hotkeys_plugins")
    KEYS = remaps_plugins.lsp

    vim.keymap.set("n", KEYS.go_to_definition, function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", KEYS.hover, function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", KEYS.workspace_symbol, function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", KEYS.open_float, function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", KEYS.go_to_next, function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", KEYS.go_to_prev, function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", KEYS.code_action, function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", KEYS.references, function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", KEYS.rename, function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", KEYS.signature_help, function()
        vim.lsp.buf.signature_help()
    end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
