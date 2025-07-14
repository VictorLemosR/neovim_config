return {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = {
                        name = "copilot",
                        model = "claude-sonnet-4",
                    },
                },
            },
            display = {
                chat = {
                    --auto_scroll = false,
                },
            },
        })

        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.codecompanion
        vim.keymap.set("n", KEYS.open_chat, "<cmd>CodeCompanionChat toggle<cr>")
        vim.keymap.set("v", KEYS.open_chat,  "<cmd>CodeCompanionChat<cr>")
    end,
}
