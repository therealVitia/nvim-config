-- Basic options for numbers, tab widht and colors

local opt = vim.opt
-- Numbers
opt.number=true
opt.relativenumber=true

--highlight line of cursor
opt.cursorline=true

-- Number of lines to keep above and below the cursor
opt.scrolloff=8

-- tabs
opt.shiftwidth=4
opt.tabstop=4

-- better colors
opt.termguicolors=true

-- persistent undo
opt.undofile=true

opt.signcolumn= 'yes'

-- make command line disapear
opt.cmdheight=0

-- disable line wrapping
opt.wrap=false
