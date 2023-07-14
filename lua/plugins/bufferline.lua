return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "BufWinEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- set to 'tabs' to only show tabpages instead
        numbers = "none", -- ordinal, buffer_id, both
        close_command = "bdelete! %d",
        right_mouse_command = "vertical sbuffer %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = "bdelete! %d",
        indicator = {
          icon = "▎",
          style = "none", --icon, underline, none
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
          -- remove extension from markdown files
          if buf.name:match("%.md") then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 20,
        diagnostics = false, -- "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        offsets = {
          { filetype = "NvimTree", text = " File Explorer", text_align = "center", separator = true },
        },
        color_icons = true,
        --[[ get_element_icon = function(element)
          -- element consists of {filetype: string, path: string, extension: string, directory: string}
          -- This can be used to change how bufferline fetches the icon
          -- for an element e.g. a buffer or a tab.
          -- e.g.
          local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(opts.filetype, { default = false })
          return icon, hl
        end, ]]
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin", -- "slant" | "padded_slant" | "slope" | "thick" | "thin" | or custom characters {'|', '|'}
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
      highlights = {
        close_button = {
          fg = "#f38ba8",
        },
        close_button_visible = {
          fg = "#f38ba8",
        },
        close_button_selected = {
          fg = "#f38ba8",
        },
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    })
  end,
}
