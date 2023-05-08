local status_ok, indentbl = pcall(require, "indent_blankline")
if not status_ok then
	print("Indent-blankline is not installed")
	return
end

indentbl.setup({
	indent_level = 10, -- default: 10
	char = "", -- [ '│','▏', '▎']
	context_char = "│",
	-- char_list = { "|", "¦", "┆", "┊" },
	-- char_list_blankline = { "|", "¦", "┆", "┊" },
	space_char_blankline = " ",
	max_indent_increase = 1,
	show_trailing_blankline_indent = false,
	show_end_of_line = false,
	show_current_context = true,
	show_current_context_start = false,
	context_pattern = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"tsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
	filetype_exclude = {
		"help",
		"dashboard",
		"packer",
		"NvimTree",
	},
	buftype_exclude = { "terminal", "nofile" },
})
