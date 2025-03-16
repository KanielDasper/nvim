vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = { noremap = true, silent = true }

-- Run lua
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- Line wrapping
vim.keymap.set("n", "J", "mzJ`z")

-- Enter cmd mode
vim.keymap.set("n", "<C-e>", ":")
vim.keymap.set("i", "<C-e>", "<Esc>:")
vim.keymap.set("v", "<C-e>", ":")

-- Escape to normal mode
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("c", "jj", "<Esc>")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Easier indentation in normal and visual mode
vim.keymap.set("v", "<", "<<gv", opts)
vim.keymap.set("v", ">", ">>gv", opts)
vim.keymap.set("n", "<", "<<g", opts)
vim.keymap.set("n", ">", ">>g", opts)

-- Prevent x delete from affecting register
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "p", '"_dp', opts)

-- Clear search highlight
vim.keymap.set("n", "<CR>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Unmaps Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Copy filepath to the clipboard
vim.keymap.set("n", "<localleader>d", function()
    local filePath = vim.fn.expand('%:p')
    vim.fn.setreg('+', filePath)
    print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })
