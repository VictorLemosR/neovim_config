return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        --Using copilt just for their .auth()
        --local remaps_plugins = require("victor.hotkeys_plugins")
        --local KEYS = remaps_plugins.copilot_completions
        --require("copilot").setup({
        --    suggestion = {
        --        enabled = false,
        --        auto_trigger = false,
        --        keymap = {
        --            accept = KEYS.accept,
        --            accept_word = false,
        --            accept_line = false,
        --            next = KEYS.next,
        --            prev = KEYS.prev,
        --            dismiss = KEYS.dismiss,
        --        },
        --    },
        --    filetypes = {
        --        python = true,
        --        lua = true,
        --        rust = false,
        --    },
        --    copilot_node_command = "node", -- Node.js version must be > 16.
        --})
    end,
}
