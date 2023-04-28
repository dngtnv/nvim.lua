-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	PACKER_BOOTSTRAP = vim.fn.system({
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

packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Packages manager
	-- PERFORMANCE --
	use({ "lewis6991/impatient.nvim" })
	-- VIEW --
	use("kyazdani42/nvim-web-devicons") -- Display web icons
	use("kyazdani42/nvim-tree.lua") -- File Explorer
	use({ "akinsho/bufferline.nvim", tag = "v3.*" }) -- Tabpage
	use("EdenEast/nightfox.nvim") -- THEME
	use("folke/tokyonight.nvim") -- THEME
	use({ "catppuccin/nvim", as = "catppuccin" }) -- THEME
	use("nvim-lualine/lualine.nvim") -- Bottom status bar
	use({ "glepnir/dashboard-nvim", event = "VimEnter" }) -- Neovim startup
	-- LSP --
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("williamboman/mason.nvim") -- LSP manager
	use("williamboman/mason-lspconfig.nvim") -- LSP manager
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics
	use("jose-elias-alvarez/typescript.nvim") -- provides basic code refactoring features
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer") -- source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("rafamadriz/friendly-snippets") -- Snippets collection
	use("onsails/lspkind-nvim") -- Vscode-like pictograms for nvim lsp completion items
	-- use("github/copilot.vim") -- AI code suggestions
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	}) -- Pure lua replacement for copilot.vim
	--[[ use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
	}) -- Transform copilot.lua into a cmp source ]]
	-- Utilities --
	use({ "NvChad/nvim-colorizer.lua" }) -- Maintained fork of the fastest Neovim colorizer
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Syntax highlighting
	use("windwp/nvim-autopairs") -- Autopairs
	use("windwp/nvim-ts-autotag") -- Autotag & autorename
	use("lukas-reineke/indent-blankline.nvim") -- Adds indentation guides to all lines
	use({ "akinsho/toggleterm.nvim", tag = "*" }) -- Toggle terminal in nvim
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Comment for ts file
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "BufReadPost",
	}) -- Highlight TODOs
	-- Treesitter modules --
	use("p00f/nvim-ts-rainbow") -- Rainbow parentheses
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}) -- Files finder
	use("famiu/bufdelete.nvim") -- Buffer delete without messup your layout
	use("numToStr/Comment.nvim") -- Commenting plugin
	use("lewis6991/gitsigns.nvim") -- Git decorations
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "BufRead",
	}) -- Lsp plugin

	if is_bootstrap then
		require("packer").sync()
	end
end)

if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
