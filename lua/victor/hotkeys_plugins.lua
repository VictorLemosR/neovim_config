-- Letters used after <leader>
-- g: github
-- h: harpoon
-- i: iron
-- l: lsp
-- t: nvim_tree
-- s: surround
-- f: telescope
-- d: trouble
-- u: undo_tree
local remaps_plugins =
{
    debugger  =  {
        run  = '<F5>',
        toggle_breakpoint = '<F8>',
        step_over = '<F10>',
        step_into = '<F11>',
        step_out = '<F12>',
        test_class = '<F1>',
        test_method = '<F2>',
    },
    fugitive = {
        git_add = "<leader>ga",
        git_push = "<leader>gps",
        git_pull = "<leader>gpl",
        git_choose_left = "gh",
        git_choose_right = "gl",
        --git_open_differences = 'dv'
    },
    harpoon = {
        add = '<leader>ha',
        menu = '<leader>he',
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
--        send_until_cursor = "<leader>ic",
--        send_mark = "", -- didn't enjoy (or understand) the mark advantage
--        mark_motion = "", -- didn't enjoy (or understand) the mark advantage
--        mark_visual = "", -- didn't enjoy (or understand) the mark advantage
--        remove_mark = "", -- didn't enjoy (or understand) the mark advantage
        cr = "<leader>ii",
        interrupt = "<leader>i<leader>",
        exit = "<leader>ie",
        clear = "<leader>ic",
        open_iron_repl = "<leader>io",
        restart_iron_repl = "<leader>ir",
    },
    leap = {
        -- s - search forward
        -- S - search backward
    },
    lsp = {
        -- remap some of defaults functions of vim for lsp. In case there is nothing to show, default pattern is used
       go_to_definition = '<leader>ld',
       hover = '<leader>lh',
       workspace_symbol = '<leader>lw',
       open_float = '<leader>lo',
       go_to_next = '<leader>ln',
       go_to_prev = '<leader>lp',
       code_action = '<leader>lc',
       references = '<leader>li', --i for imports
       rename = '<leader>lr',
       signature_help = '<leader>lh',
       format = '<leader>lf'
    },
    nvim_tree = {
        open_tree = '<leader>tt',
        open_on_notes = '<leader>tn',
        open_on_codes = '<leader>tc',
        open_on_vim = '<leader>tv',
        root_to_directory = '<leader>tr',
        -- when tree is open
        root_to_node = 'tn',
        root_to_parent = 'tp',
        -- s to open file in windows
    },
    surround = {
        normal = '<leader>si', -- i for insert
        visual = '<leader>sv',
        delete = '<leader>sd',
        change = '<leader>sr', --r for replace
    },
    telescope = {
        find_files = '<leader>ff',
        grep_search = '<leader>fg',
        buffers = '<leader>fb',
        help = '<leader>fh',
        git_files = '<leader>fg',
        help_tags = '<leader>fh'
    },
    trouble = {
        toggle = '<leader>dt',
        next = '<leader>dn',
        previous = '<leader>dp'
    },
    undo_tree = {
        open_tree = '<leader>u'
    }

}

return remaps_plugins
