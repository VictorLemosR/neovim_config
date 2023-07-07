-- Define leader key
vim.g.mapleader = " "
-- Execute program
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)
--Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Append without moving cursor
vim.keymap.set("n", "J", "mzJ`z")
--Move half window down and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--Searched words are kept in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Makes highlighted words fade after search is finished
--vim.keymap.set('c', '<CR>', ':noh<CR><CR>')
-- paste over highlighted text without losing pasted text
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Yank the text to the copy sistem
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Copy from the system
vim.keymap.set({"n", "v"}, "<leader>v", [["+gp]])
vim.keymap.set({"n", "v"}, "<A-v>", [["+gp]])
vim.keymap.set({"i", "c"}, "<A-v>", "<C-r>+")
-- Undo mode
vim.keymap.set({"n", "v"}, "<C-z>", "u")
vim.keymap.set({"i", "c"}, "<C-z>", "<C-O>u")
-- Paste mode
vim.keymap.set({"n", "v"}, "<C-y>", "<C-R>")
vim.keymap.set({"i", "c"}, "<C-y>", "<C-O><C-R>")
-- Delete without losing copied text in buffer
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- "Q" enters in an horrible mode
vim.keymap.set("n", "Q", "<nop>")
-- Didn't work for some reason. Seems nice, I'll leave it there
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- Not sure what it does yet
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- Incredible replace over the word the cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Not sure what it does either
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Escape key remap
vim.keymap.set({'i', 'v'}, 'KJ', '<esc>')
vim.keymap.set('c', 'KJ', '<c-c>')
vim.keymap.set({'i', 'v'}, 'JK', '<esc>')
vim.keymap.set('c', 'JK', '<c-c>')
-- Change root to the current file
vim.keymap.set('n', '<leader>tr', ':cd %:h<CR>', { silent = true })
-- Go to normal mode from terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
-- Change root to default paths
local codes_path = ""
local notes_path = ""
local vim_path = ""
if vim.fn.hostname() == "TF-1106" then
codes_path = 'U:/codigos'
notes_path = 'C:/Victor/Notes'
vim_path = 'C:/users/victor.santos/appdata/local/nvim'
end

vim.keymap.set('n', '<leader>tc', '<C-w><C-v>:edit ' .. codes_path .. '<CR>')
vim.keymap.set('n', '<leader>tn', '<C-w><C-v>:edit ' .. notes_path .. '<CR>')
vim.keymap.set('n', '<leader>tv', '<C-w><C-v>:edit ' .. vim_path .. '<CR>')
