local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	print("Bufferline is not installed")
	return
end

bufferline.setup({
	options = {
		mode = "buffers", -- set to 'tabs' to only show tabpages instead
		numbers = "none", -- ordinal, buffer_id, both
		number_style = "",
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			icon = "",
			style = "icon", --icon, underline, none
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "", text_align = "left", separator = true } },
		color_icons = true,
		show_buffer_icon = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin", -- slant, padded_slant, thick, thin, or custom characters {'|', '|'}
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
})
