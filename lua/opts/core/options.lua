local o = vim.opt
vim.cmd("let g:netrw_banner = 0 ")

o.guicursor = ""
o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.wrap = true
o.cursorline = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.config/vim/undodir"
o.undofile = true

o.inccommand = "split"

o.ignorecase = true
o.smartcase = true

o.termguicolors = true
o.background = "dark"

o.scrolloff = 15

-- Enable folding ( setup in nvim-ufo )
vim.o.foldenable = true -- Enable folding by default
vim.o.foldmethod = "manual" -- Default fold method (change as needed)
vim.o.foldlevel = 99 -- Open most folds by default
vim.o.foldcolumn = "0"

--split windows
o.splitright = true --split vertical window to the right
o.splitbelow = true --split horizontal window to the bottom

o.isfname:append("@-@")
o.updatetime = 50

-- clipboard
o.clipboard:append("unnamedplus") --use system clipboard as default

-- for easy mouse resizing, just incase
o.mouse = "a"
