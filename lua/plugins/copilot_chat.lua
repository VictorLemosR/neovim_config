local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

local remaps_plugins = require("victor.hotkeys_plugins")
local KEYS = remaps_plugins.copilot_chat

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
		debug = true, -- Enable debugging
		prompts = prompts,
	},

	config = function(_, opts)
		local chat = require("CopilotChat")
		local select = require("CopilotChat.select")
		-- Use unnamed register for the selection
		opts.selection = select.unnamed

		-- Override the git prompts message
		opts.prompts.Commit = {
			prompt = "Write commit message for the change with commitizen convention",
			selection = select.gitdiff,
		}
		opts.prompts.CommitStaged = {
			prompt = "Write commit message for the change with commitizen convention",
			selection = function(source)
				return select.gitdiff(source, true)
			end,
		}

		chat.setup(opts)

		vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
			chat.ask(args.args, { selection = select.visual })
		end, { nargs = "*", range = true })

		-- Inline chat with Copilot
		vim.api.nvim_create_user_command("CopilotChatInline", function(args)
			chat.ask(args.args, {
				selection = select.visual,
				window = {
					layout = "float",
					relative = "cursor",
					width = 1,
					height = 0.4,
					row = 1,
				},
			})
		end, { nargs = "*", range = true })

		-- Restore CopilotChatBuffer
		vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
			chat.ask(args.args, { selection = select.buffer })
		end, { nargs = "*", range = true })

		-- Custom buffer for CopilotChat
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "copilot-*",
			callback = function()
				vim.opt_local.relativenumber = true
				vim.opt_local.number = true

				-- Get current filetype and set it to markdown if the current filetype is copilot-chat
				local ft = vim.bo.filetype
				if ft == "copilot-chat" then
					vim.bo.filetype = "markdown"
				end
			end,
		})
	end,
	event = "VeryLazy",
	keys = {
		-- Show help actions with telescope
		{
			KEYS.help_actions,
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.help_actions())
			end,
			desc = "CopilotChat - Help actions",
		},
		-- Show prompts actions with telescope
		{
			KEYS.prompt_actions,
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end,
			desc = "CopilotChat - Prompt actions",
		},
		{
			KEYS.prompt_actions,
			":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
			mode = "x",
			desc = "CopilotChat - Prompt actions",
		},
		-- Code related commands
		{ KEYS.explain, "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
		{ KEYS.generate_tests, "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{ KEYS.review_code, "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
		{ KEYS.refactor_code, "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
		{ KEYS.better_namings, "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
		-- Chat with Copilot in visual mode
		{
			KEYS.open_vertical,
			":CopilotChatVisual",
			mode = "x",
			desc = "CopilotChat - Open in vertical split",
		},
		{
			KEYS.inline_chat,
			":CopilotChatInline<cr>",
			mode = "x",
			desc = "CopilotChat - Inline chat",
		},
		-- Custom input for CopilotChat
		{
			KEYS.ask,
			function()
				local input = vim.fn.input("Ask Copilot: ")
				if input ~= "" then
					vim.cmd("CopilotChat " .. input)
				end
			end,
			desc = "CopilotChat - Ask input",
		},
		-- Generate commit message based on the git diff
		{
			KEYS.commit_message,
			"<cmd>CopilotChatCommit<cr>",
			desc = "CopilotChat - Generate commit message for all changes",
		},
		{
			"<leader>aM",
			"<cmd>CopilotChatCommitStaged<cr>",
			desc = "CopilotChat - Generate commit message for staged changes",
		},
		-- Quick chat with Copilot
		{
			KEYS.quick_chat,
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					vim.cmd("CopilotChatBuffer " .. input)
				end
			end,
			desc = "CopilotChat - Quick chat",
		},
		-- Debug
		{ KEYS.debug, "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
		-- Fix the issue with diagnostic
		{ KEYS.diagnostics, "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
		-- Clear buffer and chat history
		{ "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
		-- Toggle Copilot Chat Vsplit
		{ "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
	},
}
