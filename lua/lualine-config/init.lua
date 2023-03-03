local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("Lualine is not installed")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "NvimTree", "toggleterm" },
		},
		ignore_focus = { "NvimTree", "toggleterm" },
		globalstatus = true, -- one statusline for all windows
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = false,
				path = 0, -- [0,1,2,3]
				shorting_target = 40,
				sysbols = {
					modified = "[+]",
					readonly = "[-]",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
			},
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
