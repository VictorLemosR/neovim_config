return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.harpoon

        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })

        vim.keymap.set("n", KEYS.add, function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", KEYS.menu, function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", KEYS.file1, function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", KEYS.file2, function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", KEYS.file3, function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", KEYS.file4, function()
            harpoon:list():select(4)
        end)

        vim.keymap.set("n", KEYS.next, function()
            harpoon:list():next()
        end)
        vim.keymap.set("n", KEYS.prev, function()
            harpoon:list():prev()
        end)
    end,
}
