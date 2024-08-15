return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- size can be a number or function which is passed the current terminal
            size = 50,
            --function(term)
            --    if term.direction == "vertical" then
            --        return 20
            --    end
            --end,
            open_mapping = [[<C-t>asrt]],
            hide_numbers = false,
            direction = "vertical", -- | 'horizontal' | 'tab' | 'float',
            start_in_insert = false,
            insert_mappings = false,
        })
        local remaps_plugins = require("victor.hotkeys_plugins")
        KEYS = remaps_plugins.toggleterm

        local RUST_TERMINAL_WINDOW = 1
        local PYTHON_TERMINAL_WINDOW = 2
        local IPYTHON_TERMINAL_WINDOW = 3
        -- Save and run file
        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.toggleterm
        vim.keymap.set("n", KEYS.save_run_file, function()
            local main_win = vim.api.nvim_get_current_win()
            local file = vim.fn.expand("%:p")
            local filetype = vim.bo.filetype
            local toggleterm = require("toggleterm")
            if filetype == "rust" then
                local command = "cargo run"

                vim.cmd("w")
                local change_directory = "cd " .. vim.fn.expand("%:p:h")
                toggleterm.exec(change_directory, RUST_TERMINAL_WINDOW)
                toggleterm.exec("cls&" .. command, RUST_TERMINAL_WINDOW)
            elseif filetype == "python" then
                local command = 'python "' .. file .. '"'

                vim.cmd("w")
                toggleterm.exec("cls\n\n&" .. command, PYTHON_TERMINAL_WINDOW)
            else
                vim.notify("WatchRun not supported for filetype " .. filetype, vim.log.levels.ERROR)
            end
            vim.api.nvim_set_current_win(main_win)
        end, { desc = "Put file to run on save" })

        -- Save and run tests
        vim.keymap.set("n", KEYS.save_run_tests, function()
            local main_win = vim.api.nvim_get_current_win()
            local filetype = vim.bo.filetype
            local toggleterm = require("toggleterm")
            if filetype == "rust" then
                local command = "cargo llvm-cov nextest --show-missing-lines"

                vim.cmd("w")
                local change_directory = "cd " .. vim.fn.expand("%:p:h")
                toggleterm.exec(change_directory, RUST_TERMINAL_WINDOW)
                toggleterm.exec("cls&" .. command, RUST_TERMINAL_WINDOW)
            else
                vim.notify("Run tests is only supported for rust")
            end
            vim.api.nvim_set_current_win(main_win)
        end, { desc = "Put file to run on save" })

        -- Run visual
        vim.keymap.set({ "v", "n" }, KEYS.run_send, function()
            local main_win = vim.api.nvim_get_current_win()
            local file = vim.fn.expand("%:p")
            local filetype = vim.bo.filetype
            local toggleterm = require("toggleterm")
            if filetype == "rust" then
                local change_directory = "cd " .. vim.fn.expand("%:p:h") .. "&cls"
                toggleterm.exec(change_directory, RUST_TERMINAL_WINDOW)
                toggleterm.send_lines_to_terminal("visual_selection", false, { args = RUST_TERMINAL_WINDOW })
            elseif filetype == "python" or filetype == "lua" then
                local ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
                if ipython_terminal == nil then
                    toggleterm.exec("ipython --no-autoindent", IPYTHON_TERMINAL_WINDOW)
                    ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
                end

                local VISUAL_LINE_MODE = "V"
                local NORMAL_MODE = "n"
                local mode = vim.fn.mode()
                if mode == VISUAL_LINE_MODE then
                    toggleterm.send_lines_to_terminal("visual_lines", false, { args = IPYTHON_TERMINAL_WINDOW })
                elseif mode == NORMAL_MODE then
                    toggleterm.send_lines_to_terminal("single_line", false, { args = IPYTHON_TERMINAL_WINDOW })
                else
                    toggleterm.send_lines_to_terminal("visual_selection", false, { args = IPYTHON_TERMINAL_WINDOW })
                end
                ipython_terminal:focus()
                local job_id = ipython_terminal.job_id
                local enter_in_string = string.char(13)
                vim.defer_fn(function()
                    vim.fn.chansend(job_id, enter_in_string)
                end, 150)
            else
                vim.notify("Language not supported for visual run", vim.log.levels.ERROR)
            end
            vim.api.nvim_set_current_win(main_win)
        end, { desc = "Put file to run on save" })

        -- Run file without saving
        vim.keymap.set({ "v", "n" }, KEYS.run_file, function()
            local main_win = vim.api.nvim_get_current_win()
            local file = vim.fn.expand("%:p")
            local filetype = vim.bo.filetype
            local toggleterm = require("toggleterm")
            if filetype == "rust" then
                --Escrever rust
            elseif filetype == "python" or filetype == "lua" then
                local data = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                local ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
                if ipython_terminal == nil then
                    toggleterm.exec("ipython --no-autoindent", IPYTHON_TERMINAL_WINDOW)
                    ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
                end
                ipython_terminal:focus()
                local job_id = ipython_terminal.job_id
                local enter_in_string = string.char(13)
                vim.fn.chansend(job_id, data)
                vim.defer_fn(function()
                    vim.fn.chansend(job_id, enter_in_string)
                end, 2000)
            else
                vim.notify("Language not supported for visual run", vim.log.levels.ERROR)
            end
            vim.api.nvim_set_current_win(main_win)
        end, { desc = "Put file to run on save" })

        vim.keymap.set("n", KEYS.open_terminal, function ()
            local rust_terminal = require("toggleterm.terminal").get(RUST_TERMINAL_WINDOW)
            if rust_terminal == nil then
                vim.cmd(":ToggleTerm")
            else
                vim.cmd(":ToggleTermToggleAll")
            end
        end, { desc = "Open all terminals or a new one" })
    end,
}
