local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  print("Lspsaga is not installed")
  return
end

lspsaga.setup({
  ui = {
    -- Currently, only the round theme exists
    theme = "round",
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡",
    diagnostic = "🐞",
    incoming = " ",
    outgoing = " ",
    hover = " ",
    kind = {},
  },
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = false,
    sign_priority = 40,
    virtual_text = true,
  },
})
