-- Letters used after <leader>
-- c: copilot_chat
-- d: trouble
-- f: telescope
-- g: github
-- h: harpoon
-- i: iron
-- l: lsp
-- o: oil
-- t: toggleterm
-- s: surround
-- u: undo_tree
local remaps_plugins =
{
    copilot_chat = {
        open = "<leader>co",
        reset = "<leader>cr",

        help_actions = "<leader>ch",
        prompt_actions = "<leader>cp",
        explain = "<leader>ce",
        generate_tests = "<leader>ct",
        review_code = "<leader>cR2",
        open_vertical = "<leader>cv",
        refactor_code = "<leader>cR",
        better_namings = "<leader>cn",
        inline_chat = "<leader>cc",
        ask = "<leader>ca",
        commit_message = "<leader>cm",
        quick_chat = "<leader>cq",
        debug = "<leader>cd",
        diagnostics = "<leader>cd",
    },
    copilot_completions = {
        accept = "<C-c><C-a>",
        next = "<C-c><C-n>",
        prev = "<C-c><C-p>",
        dismiss = "<C-c><C-c>",
    },
    debugger  =  {
        run  = '<F5>',
        toggle_breakpoint = '<F9>',
        step_over = '<F8>',
        step_into = '<F6>',
        step_out = '<F12>',
        test_class = '<F13>',
        test_method = '<F14>',
    },
    fugitive = {
        git_add = "<leader>ga",
        git_push = "<leader>gps",
        git_pull = "<leader>gpl",
        git_choose_left = "gh",
        git_choose_right = "gl",
        git_open_differences = 'dv', --not implemented automatically
    },
    harpoon = {
        add = '<leader>ha',
        menu = '<leader>hl',
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
    oil = {
        open_folder = '<leader>oo',
        open_on_notes = '<leader>on',
        open_on_codes = '<leader>oc',
        open_on_vim = '<leader>ov',
        open_on_personal_codes = '<leader>op',
        root_to_directory = '<leader>or',
        open_on_windows = '<leader>ow',
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
        help_tags = '<leader>fh',
        keymaps = '<leader>fk',
        word = '<leader>fw',
    },
    toggleterm = {
        open_terminal = '<leader>to', --must change on plugin file
        run_file = '<leader>tr',
        run_tests = '<leader>tt',
        https_client = '<leader>tc', --useful for rust web clients
        --save_run_web_client = '<leader>tw', --useful for rust web clients
        web_server = '<leader>tw', --useful for rust web clients
        send_lines_without_saving = '<leader>ts',
        send_file_without_saving = '<leader>tf',
    },
    trouble = {
        toggle = '<leader>dt',
    },
    undo_tree = {
        open_tree = '<leader>u'
    }

}

return remaps_plugins
