vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Run lua and source file
keymap("n", "J", "mzJ`z", { desc = "Join line below" })

-- yanking
keymap("n", "<localleader>q", ":registers<CR>", { desc = "Show registers" })
keymap("n", "<leader>y", ":%y+<CR>", { desc = "Yank the whole buffer" })

-- Enter cmd mode
keymap("n", "<C-e>", ":", { desc = "Enter command mode" })
keymap("i", "<C-e>", "<Esc>:", { desc = "Enter command mode" })
keymap("v", "<C-e>", ":", { desc = "Enter command mode" })

-- Escape to normal mode
keymap({ "i", "c" }, "jj", "<Esc>", { desc = "Escape to normal mode" })

keymap("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Easier indentation in normal and visual mode
keymap("v", "<", "<<gv", opts)
keymap("v", ">", ">>gv", opts)
keymap("n", "<", "<<g", opts)
keymap("n", ">", ">>g", opts)

-- Prevent x and d delete from affecting register
keymap("n", "x", '"_x', { desc = "Don't copy deleted text" })
keymap("v", "p", '"_dp', { desc = "Don't copy deleted text" })

-- Undo remap
keymap("n", "U", "<C-r>", { desc = "Undo" })

-- Clear search highlight
keymap("n", "<Esc>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Unmaps Q in normal mode
keymap("n", "Q", "<nop>", { desc = "Unmaps Q in normal mode" })

-- Highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Copy filepath to the clipboard
keymap("n", "<localleader>d", function()
	local filePath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
