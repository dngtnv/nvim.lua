local set = vim.opt

-- Off auto comment new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

--vim.cmd('autocmd!')
vim.scriptencoding = "utf-8"
vim.wo.number = true

-- context-indent-blankline-highlighted by treesitter
-- set.list = true
-- set.listchars:append("space:.")
-- set.listchars:append("eol:↴")

-- set.guicursor = "" -- Fat cursor
-- set.guifont = "CaskaydiaCove NF Mono:h12"

-- disable nvim intro
set.shortmess:append("sI")

set.backup = false
set.clipboard = "unnamedplus"
set.completeopt = { "menuone", "noselect" }
set.concealcursor = "nc" -- Hide * markup for bold and italic
set.conceallevel = 0     -- Hide * markup for bold and italic
set.confirm = true       -- Confirm to save changes before exiting modified buffer
set.mouse = "a"
set.mousemoveevent = true
set.pumheight = 10
set.showcmd = false
set.showmode = false
set.showtabline = 2
set.cmdheight = 1

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

set.hlsearch = true
set.incsearch = true
set.fillchars = { eob = " " }
set.ignorecase = true
set.smartcase = true
set.autoindent = true
set.smartindent = true
set.smarttab = true
set.breakindent = true
set.backspace = "start,eol,indent"
set.wildignore:append({ "*/node_modules/*" })

set.swapfile = false
set.backup = false
set.backup = false
set.timeoutlen = 400
set.undofile = true
set.undolevels = 10000
set.updatetime = 200 -- Save swap file and trigger CursorHold
set.writebackup = false
set.expandtab = true

set.title = true
set.splitbelow = true
set.splitright = true
set.laststatus = 3
set.wrap = false
set.scrolloff = 8
set.sidescrolloff = 8
set.fileencoding = "utf-8"
set.termguicolors = true
-- set.colorcolumn = "80"  -- show column line
set.inccommand = "split"
set.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

set.relativenumber = true
set.cursorline = true
set.winblend = 0
set.wildoptions = "pum"
set.pumblend = 5
set.background = "dark"
set.number = true
set.numberwidth = 2
set.ruler = false
set.signcolumn = "yes"

set.hidden = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
set.whichwrap:append("<>[]hl")

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- autocmd --
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- don't load the plugins below
local builtins = {
  "gzip",
  "zip",
  "zipPlugin",
  "fzf",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "matchit",
  "logiPat",
  "logipat",
  "rrhelper",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  --[[ "tohtml",
  "getriptPlugin",
  "spellfile_plugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
  "editorconfig", ]]
}

for _, plugin in ipairs(builtins) do
  vim.g["loaded_" .. plugin] = 1
end
