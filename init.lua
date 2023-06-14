--exemplo para me basear: https://github.com/smolck/dotfiles/blob/master/.config/nvim/lua/init.lua
local variables = require("victor.variables_user")
--Define python executable
vim.g.python3_host_prog = variables.python_path

require("victor")

-- Lazy.nvim install, if not found
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Code from net, re-look into it after
function url_encode(str)
  if str then
    str = str:gsub("\n", "\r\n")
    str = str:gsub("([^%w %-%_%.%~])",
      function(c) return string.format("%%%02X", string.byte(c)) end)
    str = str:gsub(" ", "+")
  end
  return str
end

function _wezterm_osc7_cwd()
  local hostname = vim.loop.os_uname().nodename
  local cwd = vim.fn.getcwd()
  local encoded_cwd = url_encode(cwd)

  local osc7_seq = string.format('\027]7;file://%s/%s\027\\', hostname, encoded_cwd)

  -- Use io.write to send the sequence
  io.write(osc7_seq)
end

-- Set up the autocmd to run the function whenever the directory changes
vim.api.nvim_exec([[
    augroup OSC7
        autocmd!
        autocmd DirChanged * lua _wezterm_osc7_cwd()
    augroup END
]], false)
