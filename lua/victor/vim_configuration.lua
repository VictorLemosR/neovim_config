-- Language
vim.opt.spelllang = "en_us"
vim.opt.spell = false
-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
--Indent rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
--Do not wrap line
vim.opt.wrap = false
--Save undotree after neovim is closed. Backup disabled, so I can change with undotree, if needed
local user_folder = require("victor.paths").user_folder
vim.opt.undodir = user_folder .. "/appdata/local/nvim/undodir" --that only works for windows
vim.opt.undofile = true
vim.g.undotree_DiffCommand = "FC"
vim.opt.swapfile = false
vim.opt.backup = false
-- Searching words
vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true  -- search matters if capital letter
--enable 24bit color
vim.opt.termguicolors = true
--lines to keep above and below the cursor for a better context
vim.opt.scrolloff = 6
vim.opt.signcolumn = "number"
vim.opt.updatetime = 100
--don't fold any file (maybe let on norg and markdown)
vim.opt.foldenable = false
--Create colored column at given number of characters
vim.opt.colorcolumn = "85"
--vim.opt.tw = 85
-- Split screens
vim.opt.equalalways = false -- When a new window is created, it is not resized
vim.opt.splitright = true   -- New windows are created to the right
vim.opt.winwidth = 2        -- Minimum width of an active window
-- No timeout for shortcuts
vim.opt.timeout = false
-- Set underscore to keyword, so 'w', for example, don't ignore it
-- another solutions is to use 'f_' to move and 'ct_' to delete between words
--vim.opt.iskeyword:remove("_")
