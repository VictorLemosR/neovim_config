return {
    'tpope/vim-fugitive',

    config = function ()
        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.fugitive

        vim.keymap.set("n", KEYS.git_add, ":G add .<CR>:G<CR>")
        vim.keymap.set("n", KEYS.git_push, ":G push master")
        vim.keymap.set("n", KEYS.git_pull, ":G pull master")
        vim.keymap.set("n", KEYS.git_choose_left, ":diffget //2")
        vim.keymap.set("n", KEYS.git_choose_right, ":diffget //3")
    end
}
