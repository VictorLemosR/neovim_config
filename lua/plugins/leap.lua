return {
    "ggandor/leap.nvim",

    config = function ()
        local leap = require('leap')

        leap.add_default_mappings()
        leap.init_highlight(true)
        leap.opts.highlight_unlabeled_phase_one_targets = true
        -- Match accented characters as non-accented
        leap.opts.equivalence_classes = {
            "aâáãà",
            "eèêé",
            "iíìî",
            "oóôòõ",
            "uùúû",
            "cç",
            ' \t\r\n'
        }
        -- searchs will be case sensitive
        leap.opts.case_sensitive = false
        leap.opts.labels = "sfnlhembvgtf,.:;_?SFNJKLHODWEIMBUYVRGTAQPCXZ?"

    end
}
