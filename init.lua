local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("core.init")
require("core.mappings")
require("lazy").setup("plugins", opts)
require("colorschemes.config")
