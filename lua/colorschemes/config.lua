--[[ function ColorMyBoard(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyBoard() ]]
local toggle = true

function ToggleAcrylic(theme)
	if theme == "tokyonight" then
		require(theme).setup({
			transparent = toggle,
			-- Background styles. Can be "dark", "transparent" or "normal"
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd.colorscheme(theme)
		toggle = not toggle
	elseif theme == "catppuccin" then
		require(theme).setup({
			transparent_background = toggle,
		})
		vim.cmd.colorscheme(theme)
		toggle = not toggle
	else
		require(theme).setup({
			transparent = false,
		})
		require(theme).setup({
			transparent_background = false,
		})
		vim.cmd.colorscheme(theme)
	end
end

ToggleAcrylic("tokyonight")
