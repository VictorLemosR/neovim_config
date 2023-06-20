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
    iron = {
        send_motion = "<leader>is",
        visual_send = "<leader>is",
        send_file = "<leader>if",
        send_line = "<leader>il",
        send_until_cursor = "<leader>ic",
--        send_mark = "", -- didn't enjoy (or understand) the mark advantage
--        mark_motion = "", -- didn't enjoy (or understand) the mark advantage
--        mark_visual = "", -- didn't enjoy (or understand) the mark advantage
--        remove_mark = "", -- didn't enjoy (or understand) the mark advantage
        cr = "<leader>i<CR>",
        interrupt = "<leader>ii",
        exit = "<leader>ie",
        clear = "<leader>irc",
        open_iron_repl = "<leader>ir",
        restart_iron_repl = "<leader>irr",
    },
    leap = {
        -- s - search forward
        -- S - search backward
    },
    lsp = {
        -- Configure after, so many hotkeys
    },
    nvim_tree = {
        open_tree = '<leader>tt',
        open_on_notes = '<leader>tp',
        open_on_codes = '<leader>tc',
        -- when tree is open
        root_to_node = 'tn',
        root_to_parent = 'tp',
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
