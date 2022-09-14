local set = vim.opt

--vim.cmd('autocmd!')
vim.scriptencoding = 'utf-8'
vim.wo.number = true

set.backup = false
set.clipboard = 'unnamedplus'
set.completeopt = { 'menuone', 'noselect' }
set.conceallevel = 0
set.mouse = 'a'
set.pumheight = 10
set.showcmd = false 
set.showmode = false 
set.showtabline = 2
set.cmdheight = 1

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.autoindent = true
set.smartindent = true
set.smarttab = true
set.breakindent = true
set.backspace = 'start,eol,indent'
set.wildignore:append { '*/node_modules/*' }

set.swapfile = false
set.undofile = true
set.writebackup = false
set.expandtab = true

set.title = true
set.splitbelow = true
set.splitright = true
set.laststatus = 2
set.wrap = false
set.scrolloff = 8
set.sidescrolloff = 8
set.fileencoding = 'utf-8'
set.termguicolors = true
set.inccommand = 'split'

set.relativenumber = true
set.cursorline = true
set.winblend = 0
set.wildoptions = 'pum'
set.pumblend = 5
set.background = 'dark'
set.number = true
set.numberwidth = 4
set.signcolumn = 'yes'

set.hidden = true
