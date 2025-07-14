return {
	"mrcjkb/rustaceanvim",
	version = "*", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                on_attach = function(_, bufnr)
                    --vim.keymap.set("n", "K", function() vim.cmd.RustLsp { "hover", "actions" } end, { buffer = bufnr })
                end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
