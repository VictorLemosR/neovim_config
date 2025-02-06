--Buscar inspiração em iron.nvim pra mandar do python pro terminal
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
        local RUST_CLIENT_WINDOW = 4

        --Useful to cd rust to default directory
        function trim_deepest_src(path)
            local last_src_index = nil
            local pattern = "\\src\\"
            local start = 1

            if string.find(path, "\\src", string.len(path) - 3) then
                return string.sub(path, 1, string.len(path) - 3)
            else
                while true do
                    local s, e = string.find(path, pattern, start)
                    if not s then
                        break
                    end
                    last_src_index = e
                    start = e + 1
                end

                if last_src_index then
                    return string.sub(path, 1, last_src_index - #pattern)
                else
                    return path
                end
            end
        end

        -- Command to test http servers
        vim.keymap.set("n", KEYS.save_run_client, function()
            local toggleterm = require("toggleterm")
            local filetype = vim.bo.filetype
            if filetype == "rust" then
                --local filename = vim.fn.expand("%:t")
                local command = "cargo run --bin client_mock"

                vim.cmd("w")
                local change_directory = "cd " .. trim_deepest_src(vim.fn.expand("%:p:h"))
                toggleterm.exec(change_directory, RUST_CLIENT_WINDOW)
                toggleterm.exec("cls&" .. command, RUST_CLIENT_WINDOW)
            else
                vim.notify("Run client command only available in rust" .. filetype, vim.log.levels.ERROR)
            end
        end, { desc = "Run client to test http servers" })

        -- Save and run file
        vim.keymap.set("n", KEYS.save_run_file, function()
            local main_win = vim.api.nvim_get_current_win()
            local file = vim.fn.expand("%:p")
            local filetype = vim.bo.filetype
            local toggleterm = require("toggleterm")
            if filetype == "rust" or filetype == "toml" then
                local command = "cargo run"

                vim.cmd("w")
                local change_directory = "cd " .. trim_deepest_src(vim.fn.expand("%:p:h"))
                toggleterm.exec(change_directory, RUST_TERMINAL_WINDOW)
                toggleterm.exec("cls&" .. command, RUST_TERMINAL_WINDOW)
            elseif filetype == "python" then
                local command = 'python "' .. file .. '"'

                vim.cmd("w")
                local change_directory = "cd C:\\"
                toggleterm.exec(change_directory, PYTHON_TERMINAL_WINDOW)
                toggleterm.exec("cls\n\n&" .. command, PYTHON_TERMINAL_WINDOW)
            else
                vim.notify("Save and run not supported for filetype " .. filetype, vim.log.levels.ERROR)
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
                local change_directory = "cd " .. trim_deepest_src(vim.fn.expand("%:p:h"))
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
                local change_directory = "cd " .. trim_deepest_src(vim.fn.expand("%:p:h")) .. "&cls"
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
                local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                lines = remove_empty_lines(lines)
                local ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
                if ipython_terminal == nil then
                    toggleterm.exec("ipython --no-autoindent", IPYTHON_TERMINAL_WINDOW)
                    ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
                end
                ipython_terminal:focus()
                local job_id = ipython_terminal.job_id
                local enter_in_string = string.char(13)
                vim.fn.chansend(job_id, lines)
                vim.api.nvim_chan_send(job_id, table.concat(lines, "\n"))
                vim.defer_fn(function()
                    vim.fn.chansend(job_id, enter_in_string)
                end, 2000)
            else
                vim.notify("Language not supported for visual run", vim.log.levels.ERROR)
            end
            vim.api.nvim_set_current_win(main_win)
        end, { desc = "Put file to run on save" })

        vim.keymap.set("n", KEYS.open_terminal, function()
            local rust_terminal = require("toggleterm.terminal").get(RUST_TERMINAL_WINDOW)
            if rust_terminal == nil then
                vim.cmd(":ToggleTerm")
            else
                vim.cmd(":ToggleTermToggleAll")
            end
        end, { desc = "Open all terminals or a new one" })
        function remove_empty_lines(lines)
            local newlines = {}

            for _, line in pairs(lines) do
                if string.len(line:gsub("%s", "")) > 0 then
                    table.insert(newlines, line)
                end
            end

            return newlines
        end
    end,
}
