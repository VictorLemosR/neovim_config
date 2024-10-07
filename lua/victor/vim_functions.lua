-- Deactivate highlights after search is finished
local hl_ns = vim.api.nvim_create_namespace("search")
local hlsearch_group = vim.api.nvim_create_augroup("hlsearch_group", { clear = true })

local function manage_hlsearch(char)
    local key = vim.fn.keytrans(char)
    local keys = { "<CR>", "n", "N", "*", "#", "?", "/" }

    if vim.fn.mode() == "n" then
        if not vim.tbl_contains(keys, key) then
            vim.cmd([[ :set nohlsearch ]])
        elseif vim.tbl_contains(keys, key) then
            vim.cmd([[ :set hlsearch ]])
        end
    end

    vim.on_key(nil, hl_ns)
end

vim.api.nvim_create_autocmd("CursorMoved", {
    group = hlsearch_group,
    callback = function()
        vim.on_key(manage_hlsearch, hl_ns)
    end,
})

-- Function to look for the error line in repl and redirect to the code expecting to be one left window
function get_line_text()
    local line = vim.api.nvim_get_current_line()
    local non_space_code = ""
    for i = 1, string.len(line), 1 do
        if string.sub(line, i, i):match("[a-zA-Z]") then
            non_space_code = string.sub(line, i, -1)
            break
        end
    end

    vim.cmd("wincmd h")
    vim.fn.search(non_space_code)
end

vim.keymap.set("n", "<F3>", "<cmd> lua get_line_text()<cr>")

-- Functions to insert print for debugging
local print_counter = 0
function insert_print()
    vim.api.nvim_command("stopinsert")
    print_counter = print_counter + 1

    local filetype = vim.bo.filetype
    if filetype == "python" or filetype == "lua" then
        PRINT_TEXT = "print('debugging " .. print_counter .. "')"
    elseif filetype == "rust" then
        PRINT_TEXT = 'println!("debugging ' .. print_counter .. '");'
    else
        vim.notify("Insert print not supported for filetype " .. filetype, vim.log.levels.ERROR)
        return
    end

    local line = vim.api.nvim_win_get_cursor(0)[1]
    local spaces = vim.fn.indent(line)
    local write_print = string.rep(" ", spaces) .. PRINT_TEXT
    vim.cmd("normal O")
    vim.api.nvim_set_current_line(write_print)
end

function print_python_variable()
    vim.api.nvim_command("stopinsert")
    vim.cmd("normal yiw")


    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local text_on_line = vim.api.nvim_get_current_line()
    local check_self_copied = text_on_line:sub(pos + 1, pos + 5)
    if check_self_copied == "self." then
        vim.cmd("normal veeey")
    elseif pos > 5 then
        local check_self_before = text_on_line:sub(pos - 4, pos)
        if check_self_before == "self." then
            vim.cmd("normal bbveeey")
        end
    end

    local yanked_variable = vim.fn.getreg('"')
    local filetype = vim.bo.filetype
    if filetype == "python" then
        PRINT_TEXT = 'print(f"' .. yanked_variable .. ': {' .. yanked_variable .. '}")'
    elseif filetype == "rust" then
        PRINT_TEXT = 'println!("' .. yanked_variable .. ': {}", ' .. yanked_variable .. ');'
    elseif filetype == "lua" then
        PRINT_TEXT = 'print("' .. yanked_variable .. ': {' .. yanked_variable .. '}")'
    else
        vim.notify("Insert print not supported for filetype " .. filetype, vim.log.levels.ERROR)
        return
    end

    local line = vim.api.nvim_win_get_cursor(0)[1]
    local spaces = vim.fn.indent(line)
    local write_print = string.rep(" ", spaces) .. PRINT_TEXT
    vim.cmd("normal o")
    vim.api.nvim_set_current_line(write_print)
end

vim.keymap.set({ "n", "i" }, "<F1>", "<cmd>lua insert_print()<CR>")
vim.keymap.set({ "n", "i" }, "<F2>", '<cmd>lua print_python_variable()<CR>')

-- Run file on save
-- CUSTOM_GROUP = vim.api.nvim_create_augroup("run_file_on_save", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = CUSTOM_GROUP,
--     pattern = { "*.rs", "*.py" },
--     callback = function()
--         local main_win = vim.api.nvim_get_current_win()
--         local file = vim.fn.expand("%:p")
--         local filetype = vim.bo.filetype
--         local toggleterm = require("toggleterm")
--         if filetype == "python" then
--             local command = 'python "' .. file .. '"'
--             toggleterm.exec("cls&" .. command)
--         elseif filetype == "rust" then
--             local command = "cargo run"
--             local change_directory = "cd " .. vim.fn.expand("%:p:h")
--             toggleterm.exec(change_directory)
--             toggleterm.exec("cls&" .. command)
--         else
--             vim.notify("WatchRun not supported for filetype " .. filetype, vim.log.levels.ERROR)
--         end
--         vim.api.nvim_set_current_win(main_win)
--     end,
-- })
