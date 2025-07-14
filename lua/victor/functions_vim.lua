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

function obtain_function_name(file_type)
	local cursor_position = vim.api.nvim_win_get_cursor(0)
	local line_number = cursor_position[1]
	local column_number = cursor_position[2]
	-- Get the current buffer content
	local buffer_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	-- Find the function name
	local function_name = nil
	for i = line_number, 1, -1 do
		local line = buffer_content[i]
		if file_type == "python" then
			if column_number == 0 then
				break
			end
			local match = line:match("def%s+([%w_]+)%s*%(")
			if match then
				function_name = match
				break
			end
		elseif file_type == "rust" then
			local match = line:match("fn%s+([%w_]+)%s*%(")
			if match then
				function_name = match
				break
			end
		end
	end

	if function_name == nil then
		function_name = "Not inside a function"
	end

	return function_name
end

-- Functions to insert print for debugging
local print_counter = 0
function insert_print()
	vim.api.nvim_command("stopinsert")
	print_counter = print_counter + 1

	local filename = vim.fn.expand("%:t")
	local file_type = vim.bo.filetype
	if file_type == "python" or file_type == "lua" then
		local function_name = obtain_function_name(file_type)
		PRINT_TEXT = "print('->> Debugging "
			.. print_counter
			.. " <<- function: "
			.. function_name
			.. "; file: "
			.. filename
			.. "')"
	elseif file_type == "rust" then
		local function_name = obtain_function_name(file_type)
		PRINT_TEXT = 'println!("->> Debugging '
			.. print_counter
			.. " <<- function: "
			.. function_name
			.. "; file:"
			.. filename
			.. '");'
	else
		vim.notify("Insert print not supported for filetype " .. file_type, vim.log.levels.ERROR)
		return
	end

	local line = vim.api.nvim_win_get_cursor(0)[1]
	local spaces = vim.fn.indent(line)
	local write_print = string.rep(" ", spaces) .. PRINT_TEXT
	vim.cmd("normal O")
	vim.api.nvim_set_current_line(write_print)
end

function print_variable()
	vim.api.nvim_command("stopinsert")
	vim.cmd("normal yiw")
	local filename = vim.fn.expand("%:t")

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
	local file_type = vim.bo.filetype
	if file_type == "python" then
		local function_name = obtain_function_name(file_type)
		PRINT_TEXT = 'print(f"->> '
			.. yanked_variable
			.. " <<- function: "
			.. function_name
			.. "; file: "
			.. filename
			.. "\\n{"
			.. yanked_variable
			.. '}")'
	elseif file_type == "rust" then
		local function_name = obtain_function_name(file_type)
		PRINT_TEXT = 'println!("->> '
			.. yanked_variable
			.. " <<- function: "
			.. function_name
			.. "; file: "
			.. filename
			.. '\\n{' .. yanked_variable .. ':?}");' 
	elseif file_type == "lua" then
		local function_name = obtain_function_name(file_type)
		PRINT_TEXT = 'print("->> '
			.. yanked_variable
			.. " <<- file: "
			.. filename
			.. "\\n \" .. "
			.. yanked_variable
			.. ' ..\" ")'
	else
		vim.notify("Insert print not supported for filetype " .. file_type, vim.log.levels.ERROR)
		return
	end

	local line = vim.api.nvim_win_get_cursor(0)[1]
	local spaces = vim.fn.indent(line)
	local write_print = string.rep(" ", spaces) .. PRINT_TEXT
	vim.cmd("normal o")
	vim.api.nvim_set_current_line(write_print)
end

vim.keymap.set({ "n", "i" }, "<F1>", "<cmd>lua print_variable()<CR>")
vim.keymap.set({ "n", "i" }, "<F2>", "<cmd>lua insert_print()<CR>")

--Adicionar nome do arquivo. Linha. Nome da fun'c~ao

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
