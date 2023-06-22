return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      -- size = 20 \ function(term)
      size = function(term)
        if term.direction == "horizontal" then
          return 10
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      highlights = {
        FloatBorder = {
          guifg = "#29a4bd",
        },
      },
      shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark background, 3 for light
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", --horizontal, float, vertical, tab
      close_on_exit = true,
      auto_scroll = true,
      float_opts = {
        border = "single", -- single, double, shadow, curved
        width = 100,
        height = 20,
        winblend = 0,
        highlights = {
          border = "normal",
          background = "normal",
        },
      },
      winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
    })
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    local Terminal = require("toggleterm.terminal").Terminal

    local htop = Terminal:new({
      cmd = "htop",
      direction = "float",
      hidden = true,
    })
    function _HTOP_TOGGLE()
      htop:toggle()
    end

    -- Commitizen
    local git_cz = "git cz"
    local git_commit = Terminal:new({
      cmd = git_cz,
      dir = "git_dir",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "single",
      },
    })

    function _GIT_COMMIT_TOGGLE()
      git_commit:toggle()
    end
  end,
}
