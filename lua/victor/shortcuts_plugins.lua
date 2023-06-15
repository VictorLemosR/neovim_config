local remaps_plugins =
{
    harpoon = {
        add = '<leader>a',
        menu = '<leader>e',
        file1 = '<leader>1',
        file2 = '<leader>2',
        file3 = '<leader>3',
        file4 = '<leader>4',
        next = '<leader><Right>',
        prev = '<leader><Left>',
    },
    leap = {
        -- s - search forward
        -- S - search backward
    },
    lsp = {
        -- Configure after, so many hotkeys
    },
    nvim_tree = {
        open_on_file = '<leader>tt',
        open_on_notes = '<leader>',
        open_on_codes = '<leader>',
        -- when tree is open
        root_to_node = '<leader>n',
        root_to_parent = 'rp',
    },
    telescope = {
        find_files = '<leader>ff',
        grep_search = '<leader>fg',
        buffers = '<leader>fb',
        help = '<leader>fh',
        git_files = '<leader>fg'
    },
    undo_tree = {
        open_tree = '<leader>u'
    }

}

return remaps_plugins
