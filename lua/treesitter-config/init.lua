local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	autotag = {
		enable = true,
	},
	-- A list of parser names, or "all"
	ensure_installed = { "html", "css", "scss", "tsx", "typescript", "javascript", "json", "lua" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	--ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		--disable = { "c", "rust" },
		disable = {},

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
		context_commentstring = {
			enable = true,
			config = {
				css = "// %s",
				javascript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_frament = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
				typescript = { __default = "// %s", __multiline = "/* %s */" },
			},
		},
	},
	indent = { enable = true, disable = { "html", "tsx", "jsx", "yaml" } },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
