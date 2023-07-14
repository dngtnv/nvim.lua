return {
	"numToStr/Comment.nvim",
	event = "BufRead",

	config = function()
		require("Comment").setup({
			ignore = "^$",
			padding = true,
			sticky = true,
			toggler = {
				-- Line-comment toggle keymap
				line = "gcc",
				-- Block-comment toggle keymap
				block = "gbc",
			},
			opleader = {
				--Line-comment keymap
				line = "gc",
				--Block-comment keymap
				block = "gb",
			},
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				basic = true, -- gcc, gbc
				extra = false, -- gco, gcO, gcA
			},
			pre_hook = function(ctx)
				-- Only calculate commentstring for tsx filetypes
				if vim.bo.filetype == "typescriptreact" then
					local U = require("Comment.utils")

					-- Determine whether to use linewise or blockwise commentstring
					local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

					-- Determine the location where to calculate commentstring from
					local location = nil
					if ctx.ctype == U.ctype.blockwise then
						location = require("ts_context_commentstring.utils").get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require("ts_context_commentstring.utils").get_visual_start_location()
					end

					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = type,
						location = location,
					})
				end
			end,
		})
	end,
}
