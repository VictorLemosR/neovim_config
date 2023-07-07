local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.code_actions.refactoring,
	},
    debug = false,
})

vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>")
