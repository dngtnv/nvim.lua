local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Telescope is not installed")
	return
end

telescope.setup({
	defaults = {
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--no-ignore-vcs", "--hidden", "--glob", "!.git/*" },
		},
	},
	file_ignore_patterns = {
		"node_modules",
		"build",
		"dist",
	},
})
