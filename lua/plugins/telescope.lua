return {
    'nvim-telescope/telescope.nvim',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function ()
        local remaps_plugins = require("victor.hotkeys_plugins")
        KEYS = remaps_plugins.telescope

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', KEYS.find_files, builtin.find_files, {})
        vim.keymap.set('n', KEYS.git_files, builtin.git_files, {})
        vim.keymap.set('n', KEYS.buffers, builtin.buffers, {})
        vim.keymap.set('n', KEYS.grep_search, builtin.live_grep, {})
        vim.keymap.set('n', KEYS.help_tags, builtin.help_tags, {})
    end
}
