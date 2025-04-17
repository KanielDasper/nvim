return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		-- None LSP-dependent keymaps
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>ft", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
	},
}
