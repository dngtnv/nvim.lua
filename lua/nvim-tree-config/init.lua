local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	print("Nvim-tree is not installed")
	return
end

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

nvimtree.setup({
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = false,
	view = {
		adaptive_size = true,
		centralize_selection = true,
		side = "left",
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
		},
	},
	filters = {
		dotfiles = false,
		custom = { "node_modules", "^.git$" },
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		debounce_delay = 50,
	},
	git = {
		enable = true,
		ignore = false,
	},
	--[[ log = {
        enable = true,
        truncate = true,
        types = {
            git = true,
            profile = true,
        },
    }, ]]
})
