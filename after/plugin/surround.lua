local remaps_plugins = require("victor.hotkeys_plugins")
KEYS = remaps_plugins.surround

require("nvim-surround").setup({
    keymaps = {
            normal = KEYS.normal,
            visual = KEYS.visual,
            delete = KEYS.delete,
            change = KEYS.change,
        }
})
