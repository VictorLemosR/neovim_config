require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "C:/Victor/notes",
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
                "<C:/Victor/notes>/<markdown>-export"
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
