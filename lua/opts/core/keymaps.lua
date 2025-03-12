vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "_", ":m '>+1<CR>gv=gv", { desc = "moves lines down in normal mode" })
vim.keymap.set("n", "-", ":m '<-2<CR>gv=gv", { desc = "moves lines up in normal mode" })

vim.keymap.set("n", "J", "mzJ`z")

-- Enter cmd mode
vim.keymap.set("n", "<C-e>", ":")

-- Escape to normal mode
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("c", "jj", "<Esc>")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Easier indentation in normal and visual mode
vim.keymap.set("v", "<", "<<gv", opts)
vim.keymap.set("v", ">", ">>gv", opts)
vim.keymap.set("n", "<", "<<gv", opts)
vim.keymap.set("n", ">", ">>gv", opts)

-- Paste without replacing register
vim.keymap.set("x", "<leader>p", "[[_dP]]")

-- Prevent x delete from affecting register
vim.keymap.set("n", "x", '"_x', opts)

-- Yank without affecting register
vim.keymap.set("v", "p", '"_dp', opts)

-- Delete without affecting register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Clear search highlight
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Unmaps Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Replace word under cursor globally
vim.keymap.set("n", "<leader>rw", 
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Tab management
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<Tab>", "<cmd>tabnext<CR>", { desc = "Go to next tab" })

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
