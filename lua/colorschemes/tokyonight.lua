local tokyonight = require("tokyonight")
local toggle = true

function ToggleTrans()
  if toggle then
    tokyonight.setup({
      style = "storm",
      transparent = toggle,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, _)
        hl.NvimTreeSpecialFile = {
          fg = "#ff9e64",
          underline = false,
        }
      end,
    })
    vim.cmd.colorscheme("tokyonight")
    toggle = not toggle
  else
    tokyonight.setup({
      style = "storm",
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
      on_highlights = function(hl, _)
        hl.NvimTreeSpecialFile = {
          fg = "#ff9e64",
          underline = false,
        }
      end,
    })
    vim.cmd.colorscheme("tokyonight")
    toggle = not toggle
  end
end

ToggleTrans()

-- tokyonight.setup({
--   style = "storm",
--   transparent = false,
--   on_highlights = function(hl, _)
--     hl.NvimTreeSpecialFile = {
--       fg = "#ff9e64",
--       underline = false,
--     }
--   end,
-- })

-- vim.cmd([[colorscheme tokyonight]])
