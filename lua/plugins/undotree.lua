return {
    'mbbill/undotree',

    config = function ()
        local remaps_plugins = require("victor.hotkeys_plugins")
        KEYS = remaps_plugins.undo_tree

        vim.keymap.set("n", KEYS.open_tree, vim.cmd.UndotreeToggle)

    end
}
