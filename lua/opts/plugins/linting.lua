return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff" },
		}
		-- Set pylint to work in virtualenv
		-- lint.linters.pylint.cmd = "python"
		-- lint.linters.pylint.args = { "-m", "pylint", "-f", "json" }

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
		-- vim.keymap.set("n", "<leader>ll", function()
		-- 	lint.try_lint()
		-- end, { desc = "Trigger linting for current file" })
		-- NOTE: Toggle linting and LSP diagnostics visibility
		local isLspDiagnosticsVisible = true
		vim.keymap.set("n", "<leader>lx", function()
			isLspDiagnosticsVisible = not isLspDiagnosticsVisible
			vim.diagnostic.config({
				virtual_text = isLspDiagnosticsVisible,
				underline = isLspDiagnosticsVisible,
			})
		end, { desc = "Toggle LSP diagnostics and linter" })
	end,
}
