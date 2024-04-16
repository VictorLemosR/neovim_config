local remaps_plugins = require("victor.hotkeys_plugins")
local KEYS = remaps_plugins.telescope

return {
    "nvim-telescope/telescope.nvim",
    -- or                              , branch = '0.1.1',
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", KEYS.find_files, builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", KEYS.git_files, builtin.git_files, { desc = "List git files" })
        vim.keymap.set("n", KEYS.buffers, builtin.buffers, { desc = "List open buffers" })
        vim.keymap.set("n", KEYS.grep_search, builtin.live_grep, { desc = "Grep search around root" })
        vim.keymap.set("n", KEYS.help_tags, builtin.help_tags, { desc = "Show help tags" })
        vim.keymap.set("n", KEYS.keymaps, builtin.keymaps, { desc = "Show keymaps" })
        vim.keymap.set("n", KEYS.word, builtin.grep_string, { desc = "Search current word" })
    end,
}
