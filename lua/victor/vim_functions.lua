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
    local pos = vim.api.nvim_win_get_cursor(0)[2]
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
    return
end

vim.keymap.set("n", "<F3>", "<cmd> lua get_line_text()<cr>")

-- Functions to insert print for debugging
local print_counter = 0
function insert_print()
    print_counter = print_counter + 1
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. 'print("debugging ' .. print_counter .. '")' .. line:sub(pos + 2)
    vim.api.nvim_set_current_line(nline)
end

function print_python_variable()
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local check_self_copied = line:sub(pos + 1, pos + 5)
    if check_self_copied == "self." then
        vim.cmd("normal veeey")
        return
    end
    if pos < 5 then
        return
    end
    local check_self_before = line:sub(pos - 4, pos)
    if check_self_before == "self." then
        vim.cmd("normal bbveeey")
        return
    end
end

vim.keymap.set("n", "<F1>", "O<cmd>lua insert_print()<CR><esc>")
vim.keymap.set("i", "<F1>", "<esc>O<cmd>lua insert_print()<CR><esc>")
vim.keymap.set("n", "<F2>", 'yiw<cmd>lua print_python_variable()<CR>Oprint(f"<esc>pa: {<esc>pa}")<esc>')
vim.keymap.set("i", "<F2>", '<esc>yiw<cmd>lua print_python_variable()<CR>Oprint(f"<esc>pa: {<esc>pa}")<esc>')

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

