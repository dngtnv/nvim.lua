local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
pcall(require, "impatient")

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Packages manager
	-- PERFORMANCE --
	use({ "lewis6991/impatient.nvim" })
	-- VIEW --
	use("kyazdani42/nvim-web-devicons") -- Display web icons
	use("kyazdani42/nvim-tree.lua") -- File Explorer
	use({ "akinsho/bufferline.nvim", tag = "v2.*" }) -- Tabpage
	use("EdenEast/nightfox.nvim") -- THEME
	use("folke/tokyonight.nvim") -- THEME
	use("nvim-lualine/lualine.nvim") -- Bottom status bar
	use("glepnir/dashboard-nvim") -- Neovim startup
	-- LSP --
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("williamboman/mason.nvim") -- LSP manager
	use("williamboman/mason-lspconfig.nvim") -- LSP manager
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind-nvim") -- Vscode-like pictograms for nvim lsp completion items
	-- Utilities --
	use("norcalli/nvim-colorizer.lua") -- Color highlighter
	use("windwp/nvim-autopairs") -- Autopairs
	use("lukas-reineke/indent-blankline.nvim") -- Adds indentation guides to all lines
	use({ "akinsho/toggleterm.nvim", tag = "*" }) -- Toggle terminal in nvim
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Syntax highlighting
	-- Treesitter modules --
	use("p00f/nvim-ts-rainbow") -- Rainbow parentheses
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	}) -- Files finder
	use("famiu/bufdelete.nvim") -- Buffer delete without messup your layout
	use("numToStr/Comment.nvim") -- Commenting plugin
	use("lewis6991/gitsigns.nvim") -- Git decorations
	use("glepnir/lspsaga.nvim") -- Lsp plugin
end)
