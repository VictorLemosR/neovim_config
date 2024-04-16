return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    --config = true,

    config = function ()
        local paths = require("victor.paths")
        local notes_folder = paths.notes_folder
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = notes_folder,
                        },
                    },
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.concealer"] = {
                    config = {
                        folds = true
                    }
                },
                ["core.export"] = {
                    config = {
                        notes_folder .. "/<markdown>-export"
                    },
                },
                --                    ["core.export.markdown"] = {
                    --                        config = {
                        --                            extensions = {"todo-items-basic", "definition-lists"}
                        --                        }
                        --                    },
                        ["core.summary"] = {},
                        ["core.autocommands"] = {},
                        ["core.highlights"] = {},
                        ["core.integrations.treesitter"] = {},
                        --                    ["core.tempus"] = {},
                        --                    ["core.ui.calendar"] = {},
                    }
                }
    end
}
