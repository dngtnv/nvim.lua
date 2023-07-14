return {
	"zbirenbaum/copilot.lua", -- Pure lua replacement for copilot.vim
	cmd = "Copilot",
	event = "InsertEnter",

	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<M-a>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 16.x
			server_opts_overrides = {},
		})

		-- use this table to disable/enable filetypes
		-- vim.g.copilot_filetypes = { xml = false, markdown = false }

		-- vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
		-- vim.g.copilot_no_tab_map = true
		-- vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

		vim.cmd([[highlight CopilotSuggestion guifg=#83a598 ctermfg=8]])
	end,
}
