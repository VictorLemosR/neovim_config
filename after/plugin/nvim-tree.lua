local remaps_plugins = require("victor.shortcuts_plugins")
KEYS = remaps_plugins.nvim_tree

-- Custom mappings
vim.keymap.set('n', KEYS.open_on_file, ":NvimTreeFindFileToggle<CR>")

-- Configs
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Open Tree
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<A-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  on_attach = my_on_attach,
  actions = {
      open_file = {
          quit_on_open = true,
      }
  }
})
