return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		require("lspsaga").setup({
			ui = {
				-- This option only works in Neovim 0.9
				title = true,
				-- Border type can be single, double, rounded, solid, shadow.
				border = "single",
				winblend = 0,
				expand = "",
				collapse = "",
				code_action = "💡",
				incoming = "󰏷 ",
				outgoing = "󰏻 ",
				hover = " ",
				kind = {}, --require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
			symbol_in_winbar = {
				enable = false,
				separator = " ",
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
			lightbulb = {
				enable = true,
				enable_in_insert = false,
				sign = false,
				sign_priority = 40,
				virtual_text = true,
			},
		})
	end,
}
