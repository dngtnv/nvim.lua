local db = require("dashboard")
db.custom_header = {
	"",
	"",
	"",
	"",
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	"",
	"",
	"",
}
db.custom_center = {
	{
		icon = " ",
		desc = "New File           ",
		action = "DashboardNewFile",
		shortcut = "SPC  n",
	},
	{
		icon = " ",
		desc = "Browse Files       ",
		action = "NvimTreeToggle",
		shortcut = "SPC  e",
	},
	{
		icon = " ",
		desc = "Find File          ",
		action = "Telescope find_files",
		shortcut = "SPC ff",
	},
	{
		icon = " ",
		desc = "Find Word          ",
		action = "Telescope live_grep",
		shortcut = "SPC fg",
	},
	{
		icon = " ",
		desc = "Configure Neovim    ",
		-- action = "edit ~/.config/nvim/init.lua",
		action = "NvimTreeFindFileToggle ~/.config/nvim/",
		shortcut = "    ",
	},
	{
		icon = " ",
		desc = "Exit Neovim              ",
		action = "quit",
	},
}
