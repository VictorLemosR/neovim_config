--[a] Define leader key
vim.g.mapleader = " "

--Move whole block while in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Move half window down and center while keeping cursor at center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- paste over highlighted text without losing pasted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank the text to the copy system
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Paste from the system
vim.keymap.set({ "n", "v" }, "<A-v>", [["+gp]])
vim.keymap.set({ "i", "c", "t" }, "<A-v>", "<C-r>+")
vim.keymap.set({ "i", "c", "t" }, "<C-v>", "<C-r>+")

-- Delete without losing copied text in buffer
vim.keymap.set({ "v" }, "<leader>dd", [["_d]])

-- Just to save with :w or :W
vim.cmd("command! W w")

-- Format text to be wraped at the textwidth limit
--vim.keymap.set("n", "<leader><leader>", "gggqG")

-- Increase/decrease windows size
vim.keymap.set("n", "<C-w><C-x>", ":resize +3<CR>", { silent = true })
vim.keymap.set("n", "<C-w><C-z>", ":resize -3<CR>", { silent = true })
vim.keymap.set("n", "<C-w><C-i>", ":vertical resize +10<CR>", { silent = true })
vim.keymap.set("n", "<C-w><C-d>", ":vertical resize -10<CR>", { silent = true })

-- Save and close buffer
vim.keymap.set("n", "<leader>w", ":wq<CR>", { silent = true })

-- Incredible replace over the word the cursor is on
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>]])

-- Encapsulate line with print()
vim.keymap.set("n", "<leader>sp", [[:s/\(\s*\)\(.*\)/\1print(\2)<CR>]])
-- Not sure what it does yet
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Not sure what it does either
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Escape key remap. Used before changing keyboard layout
--vim.keymap.set({'i', 'v'}, 'KJ', '<esc>')
--vim.keymap.set('c', 'KJ', '<c-c>')
--vim.keymap.set({'i', 'v'}, 'JK', '<esc>')
--vim.keymap.set('c', 'JK', '<c-c>')

-- Change root
local paths = require("victor.paths")
local codes_folder = paths.codes_folder
local notes_folder = paths.notes_folder
local vim_folder = paths.vim_folder
local public_codes_folder = paths.public_codes_folder

local remaps = require("victor.hotkeys_plugins")
local KEYS = remaps.oil

local function open_folder(path)
    local file_type = vim.bo.filetype
    if file_type ~= "oil" then
        vim.cmd("vsplit")
    end
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
vim.keymap.set("n", KEYS.open_on_public_codes, function()
    open_folder(public_codes_folder)
end)
vim.keymap.set("n", KEYS.open_folder, function()
    if vim.bo.filetype == "oil" then
        return
    else
        vim.cmd("vsplit")
        vim.cmd(":edit %:h")
    end
end, { silent = true })
vim.keymap.set("n", KEYS.root_to_directory, function()
    if vim.bo.filetype == "oil" then
        local path = require("oil").get_current_dir()
        vim.cmd("cd " .. path)
    else
        vim.cmd(":cd %:h")
    end
end, { silent = true })
vim.keymap.set("n", KEYS.open_on_windows, function()
    if vim.bo.filetype == "oil" then
        local path = require("oil").get_current_dir()
        os.execute("start " .. path)
    else
        local current_file_dir = vim.fn.expand("%:p:h")
        os.execute("start " .. current_file_dir)
    end
end, { silent = true })

--Append without moving cursor
vim.keymap.set("n", "J", "mzJ`z")
--Searched words are kept in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Deactivates "Q", which enters in an horrible mode
vim.keymap.set("n", "Q", "<nop>")
-- Go to normal mode from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })
