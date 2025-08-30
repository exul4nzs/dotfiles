require "nvchad.options"
vim.g.mapleader = " "
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"
vim.g.maplocalleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.timeoutlen = 300
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 20
-- vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"
vim.opt.updatetime = 50
vim.opt.conceallevel = 2
vim.opt.termguicolors = true
vim.opt.guicursor = table.concat({
  "n-v-c-sm:block", -- Normal mode: block cursor
  "i-ci-ve:ver25",  -- Insert mode: vertical bar
  "r-cr-o:hor20",   -- Replace mode: underline
  "t:block-blinkon500",
  -- "a:blinkwait700-blinkoff400-blinkon250", -- Blink settings
}, ",")
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- vim.opt.incommand = "split"
vim.opt.mouse = ""
vim.opt.updatetime = 8000
vim.opt.nrformats = "bin,hex,octal,alpha"
vim.g.python3_host_prog = "/usr/bin/python3"
