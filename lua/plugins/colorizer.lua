return {
  "NvChad/nvim-colorizer.lua",
  event = "BufRead",

  config = function()
    require("colorizer").setup({
      filetyles = { "*" },
      user_default_options = {
        mode = "foreground",
        tailwind = true,
      },
    })
  end,
}
