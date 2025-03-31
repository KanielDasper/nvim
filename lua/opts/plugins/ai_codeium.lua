return {
	"Exafunction/codeium.vim",
	config = function()
		vim.g.codeium_enabled = true
		-- Toggle AI completion
		vim.api.nvim_create_user_command("CodeiumToggle", function()
			vim.g.codeium_enabled = not vim.g.codeium_enabled
		end, {})
		vim.keymap.set({ "n", "i" }, "<C-c>", "<cmd>CodeiumToggle<CR>", { silent = true })

		-- Cycle and accept ai completion
		vim.keymap.set("i", "<C-f>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-k>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-j>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
	end,
}
