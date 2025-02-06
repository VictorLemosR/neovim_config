return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()

        --vim.keymap.set("n", KEYS.root_to_parent, api.tree.change_root_to_parent, opts("Up"))
        --vim.keymap.set("n", KEYS.root_to_node, api.tree.change_root_to_node, opts("CD"))
        --vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        --vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: split vertical"))
        require("oil").setup({
            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },
                ["<CR>"] = "actions.select",
                ["v"] = { "actions.select", opts = { vertical = true } },
                [""] = false,
                [""] = false,
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["`"] = { "actions.cd", mode = "n" },
                ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["gx"] = "actions.open_external",
                ["<leader>o."] = { "actions.toggle_hidden", mode = "n" },
                ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = true,
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = false,
                -- This function defines what is considered a "hidden" file
                is_hidden_file = function(name, bufnr)
                    if name == ".." then
                        return false
                    end

                    local m = name:match("^%.") or name:match("^_")
                    return m ~= nil
                end,
                -- Sort file and directory names case insensitive
                case_insensitive = true,
                sort = {
                    -- sort order can be "asc" or "desc"
                    -- see :help oil-columns to see which columns are sortable
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
        })
    end,
}
