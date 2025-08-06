require "nvchad.options"
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.conceallevel = 2

vim.opt.termguicolors = true

-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.guicursor = table.concat({
  "n-v-c-sm:block",          -- Normal mode: block cursor
  "i-ci-ve:ver25",           -- Insert mode: vertical bar (your existing setting)
  "r-cr-o:hor20",            -- Replace mode: underline (your existing setting)
  "t:ver25",                 -- Terminal mode: SAME as Insert mode (vertical bar)
  "a:blinkwait700-blinkoff400-blinkon250", -- Blink settings (optional)
}, ",")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

