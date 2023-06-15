local remaps_plugins = require("victor.shortcuts_plugins")
KEYS = remaps_plugins.undo_tree

vim.keymap.set("n", KEYS.open_tree, vim.cmd.UndotreeToggle)
