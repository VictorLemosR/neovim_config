return {
        "nvimtools/none-ls.nvim",
        config = function()
            local none_ls = require("null-ls")
            none_ls.setup({
                sources = {
                    none_ls.builtins.formatting.stylua,
                    none_ls.builtins.formatting.black,
                    none_ls.builtins.formatting.isort,
                    none_ls.builtins.formatting.prettier,
                    --                none_ls.builtins.diagnostics.eslint,
                    --                none_ls.builtins.completion.spell,
                },
            })
    
            local remaps_plugins = require("victor.hotkeys_plugins")
            local KEYS = remaps_plugins.lsp
            vim.keymap.set("n", KEYS.format, vim.lsp.buf.format, {})
        end,
}
