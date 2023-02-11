local db = require("dashboard")
db.setup({
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = " Update", group = "@property", action = "PackerSync", key = "u" },
      {
        desc = " New File",
        group = "number",
        action = "enew",
        key = "SPC n",
      },
      {
        desc = " Browse Files",
        group = "DiagnosticHint",
        action = "NvimTreeToggle",
        key = "SPC e",
      },
      {
        desc = " Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
      {
        desc = " Exit",
        group = "Number",
        action = "quit",
        key = "q",
      },
      --[[ {
        desc = " Apps",
        group = "DiagnosticHint",
        action = "Telescope app",
        key = "a",
      },
      {
        desc = " dotfiles",
        group = "Number",
        action = "Telescope dotfiles",
        key = "d",
      }, ]]
    },
  },
})
--[[ db.custom_header = {
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
} ]]
