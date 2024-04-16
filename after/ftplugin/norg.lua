-- Few options for markdown and norg formats
vim.opt_local.wrap = true
vim.opt_local.colorcolumn = "120"
vim.opt_local.textwidth = 120
vim.opt_local.spelllang = 'pt,en_us'
vim.opt_local.expandtab = false

-- I've disabled dead keys on terminal and reactivated them this way only for
-- markdown and text formats
vim.keymap.set({"i", "c"}, "~a", "ã", {buffer = true})
vim.keymap.set({"i", "c"}, "~A", "Ã", {buffer = true})
vim.keymap.set({"i", "c"}, "~o", "õ", {buffer = true})
vim.keymap.set({"i", "c"}, "~O", "Õ", {buffer = true})
vim.keymap.set({"i", "c"}, "'c", "ç", {buffer = true})
vim.keymap.set({"i", "c"}, "'C", "Ç", {buffer = true})

vim.keymap.set({"i", "c"}, "'a", "á", {buffer = true})
vim.keymap.set({"i", "c"}, "'A", "Á", {buffer = true})
vim.keymap.set({"i", "c"}, "'e", "é", {buffer = true})
vim.keymap.set({"i", "c"}, "'E", "É", {buffer = true})
vim.keymap.set({"i", "c"}, "'i", "í", {buffer = true})
vim.keymap.set({"i", "c"}, "'I", "Í", {buffer = true})
vim.keymap.set({"i", "c"}, "'o", "ó", {buffer = true})
vim.keymap.set({"i", "c"}, "'O", "Ó", {buffer = true})
vim.keymap.set({"i", "c"}, "'u", "ú", {buffer = true})
vim.keymap.set({"i", "c"}, "'U", "Ú", {buffer = true})

vim.keymap.set({"i", "c"}, "`a", "à", {buffer = true})
vim.keymap.set({"i", "c"}, "`A", "À", {buffer = true})
vim.keymap.set({"i", "c"}, "`e", "è", {buffer = true})
vim.keymap.set({"i", "c"}, "`E", "È", {buffer = true})
vim.keymap.set({"i", "c"}, "`i", "ì", {buffer = true})
vim.keymap.set({"i", "c"}, "`I", "Ì", {buffer = true})
vim.keymap.set({"i", "c"}, "`o", "ò", {buffer = true})
vim.keymap.set({"i", "c"}, "`O", "Ò", {buffer = true})
vim.keymap.set({"i", "c"}, "`u", "ù", {buffer = true})
vim.keymap.set({"i", "c"}, "`U", "Ù", {buffer = true})

vim.keymap.set({"i", "c"}, "^a", "â", {buffer = true})
vim.keymap.set({"i", "c"}, "^A", "Â", {buffer = true})
vim.keymap.set({"i", "c"}, "^e", "ê", {buffer = true})
vim.keymap.set({"i", "c"}, "^E", "Ê", {buffer = true})
vim.keymap.set({"i", "c"}, "^i", "î", {buffer = true})
vim.keymap.set({"i", "c"}, "^I", "Î", {buffer = true})
vim.keymap.set({"i", "c"}, "^o", "ô", {buffer = true})
vim.keymap.set({"i", "c"}, "^O", "Ô", {buffer = true})
vim.keymap.set({"i", "c"}, "^u", "û", {buffer = true})
vim.keymap.set({"i", "c"}, "^U", "Û", {buffer = true})
