return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function ()
        local paths = require("victor.paths")
        local notes_folder = paths.notes_folder
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {
                    config = {
                        folds = true,
--                        icon_preset = "basic",
--                        init_open_folds = "always"
                    },
                },
--                ["core.dirman"] = {
--                    config = {
--                        workspaces = {
--                            notes = notes_folder,
--                        },
--                    },
--                },
--                ["core.completion"] = {
--                    config = {
--                        engine = "nvim-cmp",
--                    },
--                },
--                ["core.integrations.nvim-cmp"] = {},
--                ["core.qol.todo_items"] = {
--                    config = {
--                        create_todo_parents = true,
--                    },
--                },
--                ["core.export"] = {
--                    config = {
--                        notes_folder .. "/<markdown>-export"
--                    },
--                },
--                --                    ["core.export.markdown"] = {
--                    --                        config = {
--                        --                            extensions = {"todo-items-basic", "definition-lists"}
--                        --                        }
--                        --                    },
--                        ["core.summary"] = {},
--                        ["core.autocommands"] = {},
--                        ["core.highlights"] = {},
--                        ["core.integrations.treesitter"] = {},
--                        --                    ["core.tempus"] = {},
--                        --                    ["core.ui.calendar"] = {},
                    }
                }
    end
}
