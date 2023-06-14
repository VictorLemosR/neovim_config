-- Language
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
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
