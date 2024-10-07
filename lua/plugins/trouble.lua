local remaps_plugins = require("victor.hotkeys_plugins")
local KEYS = remaps_plugins.trouble

return {
	"folke/trouble.nvim",

	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			KEYS.toggle,
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}
