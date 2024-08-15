return {
    "folke/trouble.nvim",

    config = function ()
        local  remaps_plugins = require("victor.hotkeys_plugins")
        KEYS = remaps_plugins.trouble
        require('trouble').setup({
            icons = false
        })

        vim.keymap.set('n', KEYS.toggle, function ()
            require('trouble').toggle()
        end)

        vim.keymap.set('n', KEYS.next, function ()
            require('trouble').next({skip_groups = true, jump = true})
        end)

        vim.keymap.set('n', KEYS.previous, function ()
            require('trouble').previous({skip_groups = true, jump = true})
        end)
    end
}
