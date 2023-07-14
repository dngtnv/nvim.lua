return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	cmd = "Dashboard",

	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				project = {
					enable = true,
					limit = 4,
				},
				mru = {
					limit = 5,
				},
				shortcut = {
					{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
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
						desc = " Apps",
						group = "DiagnosticHint",
						action = "Lazy",
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
	end,
}
