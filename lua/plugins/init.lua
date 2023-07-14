return {
	-- Library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
	-- Colorschemes --
	{ "nvim-tree/nvim-web-devicons", lazy = true }, -- Display web icons
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", lazy = true, name = "catppuccin" },
	-- {"github/copilot.vim"}, -- AI code suggestions
}
