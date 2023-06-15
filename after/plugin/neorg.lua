require('neorg').setup {
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
            engine = "nvim-cmp"
        },
        ["core.concealer"] = {
            folds = false
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {
            extensions = {"todo-items-basic", "definition-lists"}
        },
        ["core.summary"] = {},
        ["core.ui.calendar"] = {},
        ["core.autocommands"] = {},
        ["core.highlights"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.tempus"] = {},
    }
}
