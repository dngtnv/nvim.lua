-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remove highlight
map("n", "<Esc>", ":noh<CR>", opts)

-- Toggle comment
map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Remap splits navigation to just CTRL + hjkl
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Make adjusting split sizes a bit more friendly
map("n", "<C-Left>", ":vertical resize +3<CR>", opts)
map("n", "<C-Right>", ":vertical resize -3<CR>", opts)
map("n", "<C-Up>", ":resize +3<CR>", opts)
map("n", "<C-Down>", ":resize -3<CR>", opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope mappings --
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>ft", ":TodoTelescope<CR>", opts)

-- Dashboard mappings --
map("n", "<leader>n", ":enew<CR>", opts)

-- Bufferline mappings --
-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<A->>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>:bdelete<CR>", opts)

-- Lspsaga --
-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

-- Code action
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
map("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

-- Rename
map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

-- Peek Definition
-- you can edit the definition file in this floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
-- Go to definition
-- map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show cursor diagnostic
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Show buffer diagnostics
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)

-- Diagnsotic jump
-- You can use <C-o> to jump back to your previous location
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Diagnostic jump with filters such as only jumping to an error
map("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
map("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Toggle outline
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- map("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)

-- Call hierarchy
map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
