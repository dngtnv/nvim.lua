return {
  "NvChad/nvim-colorizer.lua",
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
