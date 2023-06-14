vim.g.mapleader = " "
--Back to folder
vim.keymap.set("n", "<leader>pb", vim.cmd.Ex)
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
vim.keymap.set({"n", "v"}, "<C-v>", [["+gp]])
vim.keymap.set({"i", "c"}, "<C-v>", "<C-r>+")
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
-- Just to not type :so, I guess
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
