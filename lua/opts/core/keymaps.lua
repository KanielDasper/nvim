vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = { noremap = true, silent = true }

-- Run lua and source file
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Run lua" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Run lua" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below" })

-- yanking
vim.keymap.set("n", "<localleader>q", ":registers<CR>", { desc = "Show registers" })
vim.keymap.set("n", "<leader>y", ":%y+<CR>", { desc = "Yank the whole buffer" })

-- Enter cmd mode
vim.keymap.set("n", "<C-e>", ":", { desc = "Enter command mode" })
vim.keymap.set("i", "<C-e>", "<Esc>:", { desc = "Enter command mode" })
vim.keymap.set("v", "<C-e>", ":", { desc = "Enter command mode" })

-- Escape to normal mode
vim.keymap.set({ "i", "c" }, "jj", "<Esc>", { desc = "Escape to normal mode" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Easier indentation in normal and visual mode
vim.keymap.set("v", "<", "<<gv", opts)
vim.keymap.set("v", ">", ">>gv", opts)
vim.keymap.set("n", "<", "<<g", opts)
vim.keymap.set("n", ">", ">>g", opts)

-- Prevent x and d delete from affecting register
vim.keymap.set("n", "x", '"_x', { desc = "Don't copy deleted text" })
vim.keymap.set("v", "p", '"_dp', { desc = "Don't copy deleted text" })

-- Undo remap
vim.keymap.set("n", "U", "<C-r>", { desc = "Undo" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Unmaps Q in normal mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Unmaps Q in normal mode" })

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
	local filePath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
