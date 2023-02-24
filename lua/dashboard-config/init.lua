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
			--[[ {
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
			}, ]]
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "PackerStatus",
				key = "a",
			},
			{
				desc = " Exit",
				group = "Number",
				action = "quit",
				key = "q",
			},
			--[[ {
        desc = " dotfiles",
        group = "Number",
        action = "Telescope dotfiles",
        key = "d",
      }, ]]
		},
	},
})
