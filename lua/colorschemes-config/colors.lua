--[[ function ColorMyBoard(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyBoard() ]]
local status_ok, tokyo = pcall(require, "tokyonight")
if not status_ok then
  print("Tokyonight colorscheme is not installed")
  return
end
local toggle = true

function ToggleAcrylic()
  if toggle then
    tokyo.setup({
      transparent = true,
    })
    vim.cmd.colorscheme("tokyonight")
    toggle = false
  else
    tokyo.setup({
      transparent = false,
    })
    vim.cmd.colorscheme("tokyonight")
    toggle = true
  end
end

ToggleAcrylic()
