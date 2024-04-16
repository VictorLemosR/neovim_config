-- Language
vim.opt.spelllang = 'en_us'
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
local  user_folder =  require('victor.paths').user_folder
vim.opt.undodir = user_folder .. "/appdata/local/nvim/undodir" --that only works for windows
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
--enable 24bit color
vim.opt.termguicolors = true
--lines to keep above and below the cursor for a better context
vim.opt.scrolloff = 6
vim.opt.signcolumn = 'number' --'--testar = "number", a coluna de sign fica no lugar do n´umero, pode ser melhor
vim.opt.updatetime = 100
--don't fold any file (maybe let on norg and markdown)
vim.opt.foldenable = false
--Create colored column at given number of characters
vim.opt.colorcolumn = "85"
--vim.opt.tw = 85
-- No timeout for shortcuts
vim.opt.timeout = false
-- Deactivate highlights after search is finished
local hl_ns = vim.api.nvim_create_namespace('search')
local hlsearch_group = vim.api.nvim_create_augroup('hlsearch_group', { clear = true })

local function manage_hlsearch(char)
  local key = vim.fn.keytrans(char)
  local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }

  if vim.fn.mode() == 'n' then
    if not vim.tbl_contains(keys, key) then
      vim.cmd([[ :set nohlsearch ]])
    elseif vim.tbl_contains(keys, key) then
      vim.cmd([[ :set hlsearch ]])
    end
  end

  vim.on_key(nil, hl_ns)
end

vim.api.nvim_create_autocmd('CursorMoved', {
  group = hlsearch_group,
  callback = function()
    vim.on_key(manage_hlsearch, hl_ns)
  end,
})
-- Set underscore to keyword, so 'w', for example, don't ignore it
-- another solutions is to use 'f_' to move and 'ct_' to delete between words
--vim.opt.iskeyword:remove("_")

--Append without moving cursor
vim.keymap.set("n", "J", "mzJ`z")
--Searched words are kept in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Deactivates "Q", which enters in an horrible mode
vim.keymap.set("n", "Q", "<nop>")
-- Go to normal mode from terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
