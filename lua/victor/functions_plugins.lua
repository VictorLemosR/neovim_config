--Oil
local paths = require("victor.paths")
local codes_folder = paths.codes_folder
local notes_folder = paths.notes_folder
local vim_folder = paths.vim_folder
local personal_codes_folder = paths.personal_codes_folder

local remaps = require("victor.hotkeys_plugins")
local KEYS = remaps.oil

local function open_folder(path)
    --local file_type = vim.bo.filetype
    --if file_type ~= "oil" then
    --    vim.cmd("vsplit")
    --end
    vim.cmd(":edit " .. path)
    vim.cmd("cd " .. path)
end

vim.keymap.set("n", KEYS.open_on_codes, function()
    open_folder(codes_folder)
end)
vim.keymap.set("n", KEYS.open_on_notes, function()
    open_folder(notes_folder)
end)
vim.keymap.set("n", KEYS.open_on_vim, function()
    open_folder(vim_folder)
end)
vim.keymap.set("n", KEYS.open_on_personal_codes, function()
    open_folder(personal_codes_folder)
end)

vim.keymap.set("n", KEYS.open_folder, function()
    if vim.bo.filetype == "oil" then
        return
    else
        --vim.cmd("vsplit")
        vim.cmd(":edit %:p:h")
    end
end, { silent = true })

vim.keymap.set("n", KEYS.root_to_directory, function()
    if vim.bo.filetype == "oil" then
        local path = require("oil").get_current_dir()
        vim.cmd("cd " .. path)
        print("Changed root to " .. path)
        vim.fn.setreg("+", path) -- Copy path to clipboard
    else
        vim.cmd(":cd %:h")
        vim.cmd(":echo expand('%:p:h')")
        local path = vim.fn.expand("%:p:h")
        vim.fn.setreg("+", path) -- Copy path to clipboard
    end
end, { silent = true })

vim.keymap.set("n", KEYS.open_on_windows, function()
    if vim.bo.filetype == "oil" then
        local path = require("oil").get_current_dir()
        os.execute('start "" "' .. path .. '"')
    else
        local current_file_dir = vim.fn.expand("%:p:h")
        os.execute('start "" "' .. current_file_dir .. '"')
    end
end, { silent = true })

-- ToggleTerm
local remaps_plugins = require("victor.hotkeys_plugins")
KEYS = remaps_plugins.toggleterm

local RUST_TERMINAL_WINDOW = 1
local RUST_CLIENT_WINDOW = 2
local PYTHON_TERMINAL_WINDOW = 3
local IPYTHON_TERMINAL_WINDOW = 4

--Useful to cd rust to default directory
local function trim_deepest_src(path)
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

local function remove_empty_lines(lines)
    --local newlines = {}
    local text = ""

    for _, line in pairs(lines) do
        if string.len(line:gsub("[ \t]", "")) > 0 then
            text = text .. "\r" .. line
            --table.insert(newlines, line)
        end
    end

    --return newlines
    -- add a new line to run the code
    text = text .. "\r\n"
    return text
end

local terminal = {
    run_file = 1,
    run_tests = 2,
    web_server = 3,
    https_client = 4,
    send_lines_without_saving = 5,
    send_file_without_saving = 6,
}

local function terminal_functions(mode)
    local main_win = vim.api.nvim_get_current_win()
    local toggleterm = require("toggleterm")
    local filetype = vim.bo.filetype
    if filetype == "rust" or filetype == "toml" then
        vim.cmd("w")
        local command = ""
        if mode == terminal.run_file then
            command = "cargo run"
        elseif mode == terminal.run_tests then
            command = "cargo llvm-cov nextest --show-missing-lines"
        elseif mode == terminal.web_server then
            command = "cargo leptos watch"
        elseif mode == terminal.https_client then
            command = "cargo run --bin client_mock"
            local change_directory = "cd " .. trim_deepest_src(vim.fn.expand("%:p:h"))
            toggleterm.exec(change_directory, RUST_CLIENT_WINDOW)
            toggleterm.exec("cls&" .. command, RUST_CLIENT_WINDOW)
            return
        end

        if command == "" then
            vim.notify("Command not supported in " .. filetype, vim.log.levels.ERROR)
            return
        end
        local change_directory = "cd " .. trim_deepest_src(vim.fn.expand("%:p:h"))

        toggleterm.exec(change_directory, RUST_TERMINAL_WINDOW)
        toggleterm.exec("cls&" .. command, RUST_TERMINAL_WINDOW)
        vim.api.nvim_set_current_win(main_win)
    elseif filetype == "python" then
        if mode == terminal.run_file then
            vim.cmd("w")
            local command = 'python "' .. vim.fn.expand("%:p") .. '"'
            local change_directory = "cd C:\\"
            toggleterm.exec(change_directory, PYTHON_TERMINAL_WINDOW)
            toggleterm.exec("cls\n\n&" .. command, PYTHON_TERMINAL_WINDOW)
        elseif mode == terminal.send_lines_without_saving then

            local VISUAL_LINE_MODE = "V"
            local NORMAL_MODE = "n"
            local mode_vim = vim.fn.mode()

            local lines = ""
            if mode_vim == VISUAL_LINE_MODE then
                print("Visual line mode")
                -- HACK Break out of visual mode
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", false, true, true), "nx", false)

                local start_line, start_col
                local end_line, end_col

                start_line, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
                end_line, end_col = unpack(vim.fn.getpos("'>"), 2, 3)

                if end_line < start_line or (end_line == start_line and end_col < start_col) then
                    end_line, start_line = start_line, end_line
                    end_col, start_col = start_col, end_col
                end

                lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, 0)

                --old way
                --toggleterm.send_lines_to_terminal("visual_lines", false, { args = IPYTHON_TERMINAL_WINDOW })
            elseif mode_vim == NORMAL_MODE then
                print("Normal mode")
                local line_number = vim.api.nvim_win_get_cursor(0)[1] - 1
                lines = vim.api.nvim_buf_get_lines(0, line_number, line_number + 1, 0)[1]

                --old way
                --toggleterm.send_lines_to_terminal("single_line", false, { args = IPYTHON_TERMINAL_WINDOW })
            else
                print("Visual selection mode")
                -- HACK Break out of visual mode
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", false, true, true), "nx", false)
                local b_line, b_col
                local e_line, e_col

                local mode = vim.fn.visualmode()

                b_line, b_col = unpack(vim.fn.getpos("'<"), 2, 3)
                e_line, e_col = unpack(vim.fn.getpos("'>"), 2, 3)

                if e_line < b_line or (e_line == b_line and e_col < b_col) then
                    e_line, b_line = b_line, e_line
                    e_col, b_col = b_col, e_col
                end

                lines = vim.api.nvim_buf_get_lines(0, b_line - 1, e_line, 0)

                --old way
                --toggleterm.send_lines_to_terminal("visual_selection", false, { args = IPYTHON_TERMINAL_WINDOW })
            end
            vim.fn.setreg("+", lines)
            local ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
            if ipython_terminal == nil then
                toggleterm.exec("ipython --no-autoindent", IPYTHON_TERMINAL_WINDOW)
                ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
            end
            local job_id = ipython_terminal.job_id

            ipython_terminal:focus()
            vim.api.nvim_chan_send(job_id, "%paste\n\r")
            
            -- old way
            -- Send enter to execute the code
            --local enter_in_string = string.char(13)
            --vim.defer_fn(function()
            --    vim.fn.chansend(job_id, enter_in_string)
            --end, 150)
        elseif mode == terminal.send_file_without_saving then
            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            vim.fn.setreg("+", lines)
            
            local ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
            if ipython_terminal == nil then
                toggleterm.exec("ipython --no-autoindent", IPYTHON_TERMINAL_WINDOW)
                ipython_terminal = require("toggleterm.terminal").get(IPYTHON_TERMINAL_WINDOW)
            end
            ipython_terminal:focus()
            local job_id = ipython_terminal.job_id
            vim.api.nvim_chan_send(job_id, "%paste\n\r")

            -- Old way
            --lines = remove_empty_lines(lines)
            --local enter_in_string = string.char(13)
            --vim.fn.chansend(job_id, lines)
            --vim.api.nvim_chan_send(job_id, table.concat(lines, "\r"))
            --vim.api.nvim_chan_send(job_id, lines)
        else
            vim.notify("Command not supported in " .. filetype, vim.log.levels.ERROR)
            return
        end
        vim.api.nvim_set_current_win(main_win)
    else
        vim.notify("Command not supported in " .. filetype, vim.log.levels.ERROR)
    end
end

vim.keymap.set("n", KEYS.run_file, function()
    terminal_functions(terminal.run_file)
end, { desc = "Put file to run on save" })

vim.keymap.set("n", KEYS.run_tests, function()
    terminal_functions(terminal.run_tests)
end, { desc = "Put file to run on save" })

vim.keymap.set("n", KEYS.https_client, function()
    terminal_functions(terminal.https_client)
end, { desc = "Run a test client to test http servers" })

vim.keymap.set("n", KEYS.web_server, function()
    terminal_functions(terminal.web_server)
end, { desc = "Run a test client to test http servers" })

vim.keymap.set({ "v", "n" }, KEYS.send_lines_without_saving, function()
    terminal_functions(terminal.send_lines_without_saving)
end, { desc = "Put file to run on save" })

-- Run file without saving
vim.keymap.set({ "v", "n" }, KEYS.send_file_without_saving, function()
    terminal_functions(terminal.send_file_without_saving)
end, { desc = "Put file to run on save" })

vim.keymap.set("n", KEYS.open_terminal, function()
    local rust_terminal = require("toggleterm.terminal").get(RUST_TERMINAL_WINDOW)
    if rust_terminal == nil then
        vim.cmd(":ToggleTerm")
    else
        vim.cmd(":ToggleTermToggleAll")
    end
end, { desc = "Open all terminals or a new one" })
