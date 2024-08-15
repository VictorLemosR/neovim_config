return {
    'Vigemus/iron.nvim',

    config = function ()
        local iron = require("iron.core")
        local view = require("iron.view")
        local remaps_plugins = require("victor.hotkeys_plugins")
        KEYS = remaps_plugins.iron

        iron.setup {
            config = {
                -- Whether a repl should be discarded or not
                scratch_repl = true,
                -- Your repl definitions come here
                repl_definition = {
                    python = require("iron.fts.python").ipython,
                    sh = {
                        -- Can be a table or a function that
                        -- returns a table (see below)
                        command = {"zsh"}
                    }
                },
                -- How the repl window will be displayed
                -- See below for more information
            --    repl_open_cmd = require('iron.view').bottom(40),
            repl_open_cmd = "vertical botright 70 split"
            },
            -- Iron doesn't set keymaps by default anymore.
            -- You can set them here or manually add keymaps to the functions in iron.core
            keymaps = {
                send_motion = KEYS.send_motion,
                visual_send = KEYS.visual_send,
                send_file = KEYS.send_file,
                send_line = KEYS.send_line,
--                send_until_cursor = KEYS.send_until_cursor,
        --        send_mark = KEYS.send_mark,
        --        mark_motion = KEYS.mark_motion,
        --        mark_visual = KEYS.mark_visual,
        --        remove_mark = KEYS.remove_mark,
                cr = KEYS.cr,
                interrupt = KEYS.interrupt,
                exit = KEYS.exit,
                clear = KEYS.clear,
            },
            -- If the highlight is on, you can change how it looks
            -- For the available options, check nvim_set_hl
            highlight = {
                italic = true
            },
            ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
            -- One can always use the default commands from vim directly
        }
        -- iron also has a list of commands, see :h iron-commands for all available commands
        vim.keymap.set('n', KEYS.open_iron_repl, '<cmd>IronRepl<cr>')
        vim.keymap.set('n', KEYS.restart_iron_repl, '<cmd>IronRestart<cr>')
        -- vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
        -- vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
    end
}
