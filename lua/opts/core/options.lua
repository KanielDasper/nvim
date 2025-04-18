local opt = vim.opt
vim.cmd("let g:netrw_banner = 0 ")

opt.guicursor = ""
opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.cursorline = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.undofile = true

opt.inccommand = "split"

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"

opt.scrolloff = 15

-- Enable folding ( setup in nvim-ufo )
vim.o.foldenable = true -- Enable folding by default
vim.o.foldmethod = "manual" -- Default fold method (change as needed)
vim.o.foldlevel = 99 -- Open most folds by default
vim.o.foldcolumn = "0"

--split windows
opt.splitright = true --split vertical window to the right
opt.splitbelow = true --split horizontal window to the bottom

opt.isfname:append("@-@")
opt.updatetime = 50

-- clipboard
opt.clipboard:append("unnamedplus") --use system clipboard as default

-- for easy mouse resizing, just incase
opt.mouse = "a"
