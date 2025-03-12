-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
-- vim.cmd("let g:netrw_liststyle = 3")
local o = vim.opt
vim.cmd("let g:netrw_banner = 0 ")

o.guicursor = ""
o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.wrap = true
o.cursorline = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.incsearch = true
o.inccommand = "split"

o.ignorecase = true
o.smartcase = true

o.termguicolors = true
o.background = "dark"

o.scrolloff = 10

-- Enable folding ( setup in nvim-ufo )
vim.o.foldenable = true     -- Enable folding by default
vim.o.foldmethod = "manual" -- Default fold method (change as needed)
vim.o.foldlevel = 99        -- Open most folds by default
vim.o.foldcolumn = "0"

--split windows
o.splitright = true --split vertical window to the right
o.splitbelow = true --split horizontal window to the bottom

o.isfname:append("@-@")
o.updatetime = 50

-- clipboard
o.clipboard:append("unnamedplus") --use system clipboard as default
o.hlsearch = true

-- for easy mouse resizing, just incase
o.mouse = "a"

-- gets rid of line with white spaces
vim.g.editorconfig = true

-- Set cwd to opened file
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "silent! lcd %:p:h"
})

