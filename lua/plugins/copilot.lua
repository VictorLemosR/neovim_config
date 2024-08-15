return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.copilot_completions
		require("copilot").setup({
			suggestion = {
                auto_trigger = true,
				keymap = {
					accept = KEYS.accept,
					accept_word = false,
					accept_line = false,
					next = KEYS.next,
					prev = KEYS.prev,
					dismiss = KEYS.dismiss,
				},
			},
			filetypes = {
				python = true,
				lua = true,
                rust = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 16.
		})
	end,
}
