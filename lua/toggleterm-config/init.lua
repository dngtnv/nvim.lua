local status_ok, toggleterm = pcall(require, "toggleterm")
local Terminal = require("toggleterm.terminal").Terminal
if not status_ok then
    return
end

toggleterm.setup({
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
    shading_factor = 2,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = false,
    direction = "horizontal", --horizontal, float, vertical, tab
    close_on_exit = true,
    auto_scroll = true,
    float_opts = {
        border = "curved", -- single, double, shadow, curved
        winblend = 3,
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

local htop = Terminal:new({
    cmd = "htop",
    direction = "float",
    hidden = true,
})
function _HTOP_TOGGLE()
    htop:toggle()
end
