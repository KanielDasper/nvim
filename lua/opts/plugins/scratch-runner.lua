return {
	"DestopLine/scratch-runner.nvim",
	dependencies = "folke/snacks.nvim",
	config = function()
		require("scratch-runner").setup({
			sources = {
				-- NOTE: Lua is configured in snacks by default
				python = { "python3" },
			},
		})
	end,
}
