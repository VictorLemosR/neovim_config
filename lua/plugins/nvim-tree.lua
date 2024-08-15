return {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,
    dependencies = {'nvim-tree/nvim-web-devicons'},

    config = function ()
        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.nvim_tree

        -- Custom mappings
        vim.keymap.set('n', KEYS.open_tree, ":NvimTreeFindFileToggle!<CR>")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', KEYS.root_to_parent, api.tree.change_root_to_parent, opts('Up'))
            vim.keymap.set('n', KEYS.root_to_node, api.tree.change_root_to_node, opts('CD'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
            vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: split vertical'))
        end

        require("nvim-tree").setup({
            sort_by = "name",
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            git = {
                enable = true,
            },
            filters = {
                dotfiles = true,
                git_ignored = true,
                custom = {'^_', '*.profraw'},
            },
            on_attach = my_on_attach,
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })
    end
}
