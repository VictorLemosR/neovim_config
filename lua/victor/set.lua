vim.opt.nu = true -- activate line numbers
vim.opt.relativenumber = true --lines numbers relative
--Indent rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
--Do not wrap line
vim.opt.wrap = false
--Save undotree after neovim is closed. Backup disabled, so I can change with undotree, if needed
vim.opt.undodir = os.getenv("USERPROFILE") .. "/appdata/local/nvim/undodir" --that only works for windows
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
--enable 24bit colors
vim.opt.termguicolors = true
--lines to keep above and below the cursor for a better context
vim.opt.scrolloff = 6
vim.opt.signcolumn = "auto" --testar = "number", a coluna de sign fica no lugar do n´umero, pode ser melhor

vim.opt.updatetime = 100
--Create colored column at given number of characters
vim.opt.colorcolumn = "80"
