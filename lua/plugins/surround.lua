--Delete, change and add a delimeter: {[("''")]}
return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function ()
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

    end
}
