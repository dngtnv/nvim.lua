return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    require("indent_blankline").setup({
      indentLine_enabled = 1,
      indent_level = 10, -- default: 10
      char = "│",    -- [ '│','▏', '▎']
      context_char = "│", -- '│' highlight context
      -- char_list = { "|", "¦", "┆", "┊" },
      -- char_list_blankline = { "|", "¦", "┆", "┊" },
      space_char_blankline = " ",
      max_indent_increase = 1,
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
      show_end_of_line = false,
      show_current_context = false,
      show_current_context_start = false,
      context_pattern = {
        "class",
        "return",
        "function",
        "method",
        "^if",
        "^while",
        "jsx_element",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "tsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
      },
      filetype_exclude = {
        "help",
        "dashboard",
        "NvimTree",
        "terminal",
        "lazy",
        "Lspinfo",
        "mason",
        "TelescopePrompt",
        "TelescopeResults",
      },
      buftype_exclude = { "terminal", "nofile" },
    })
  end,
}
