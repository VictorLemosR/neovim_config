return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                work = "C:/notes/work",
                                home = "C:/notes/home",
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
                            folds = false
                        }
                    },
                    ["core.export"] = {
                        config = {
                            "<C:/Victor/notes>/<markdown>-export"
                        },
                    },
                    ["core.export.markdown"] = {
                        config = {
                            extensions = {"todo-items-basic", "definition-lists"}
                        }
                    },
                    ["core.summary"] = {},
                    ["core.autocommands"] = {},
                    ["core.highlights"] = {},
                    ["core.integrations.treesitter"] = {},
--                    ["core.tempus"] = {},
--                    ["core.ui.calendar"] = {},
                }
            }
        end,
    },
}
