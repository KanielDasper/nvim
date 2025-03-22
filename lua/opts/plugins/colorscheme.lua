return {
	-- NOTE: TokyoNight
	{
		"folke/tokyonight.nvim",
		name = "folkeTokyonight",
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "transparent",
					floats = "transparent",
				},
				on_colors = function(colors)
					colors.bg = "none"
					colors.bg_dark = "none"
					colors.bg_float = "none"
					colors.border = "#547998"
					colors.fg = "#CBE0F0"
					colors.fg_dark = "#B4D0E9"
				end,
			})
		end,
	},
}
