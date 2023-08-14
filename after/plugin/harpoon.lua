local remaps_plugins = require("victor.hotkeys_plugins")
KEYS = remaps_plugins.harpoon

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", KEYS.add, mark.add_file)
vim.keymap.set("n", KEYS.menu, ui.toggle_quick_menu)

vim.keymap.set("n", KEYS.file1, function() ui.nav_file(1) end)
vim.keymap.set("n", KEYS.file2, function() ui.nav_file(2) end)
vim.keymap.set("n", KEYS.file3, function() ui.nav_file(3) end)
vim.keymap.set("n", KEYS.file4, function() ui.nav_file(4) end)

vim.keymap.set("n", KEYS.next, function() ui.nav_next() end)
vim.keymap.set("n", KEYS.prev, function() ui.nav_prev() end)
