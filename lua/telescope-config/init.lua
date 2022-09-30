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
})
