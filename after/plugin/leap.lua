local leap = require('leap')

leap.add_default_mappings()
leap.init_highlight(true)
leap.opts.highlight_unlabeled_phase_one_targets = true
-- Change to not jump to first match
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
leap.opts.case_sensitive = true
