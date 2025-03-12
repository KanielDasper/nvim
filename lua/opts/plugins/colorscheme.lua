return {
	-- NOTE: Solarized Osaka
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark",
				},
				dim_inactive = false,
				lualine_bold = false,
			})
		end,
	},
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
	-- NOTE: Ayu
	{
		"Shatur/neovim-ayu",
		config = function()
			require("ayu").setup({
				overrides = {
					Normal = { bg = "None" },
					NormalFloat = { bg = "none" },
					ColorColumn = { bg = "None" },
					SignColumn = { bg = "None" },
					Folded = { bg = "None" },
					FoldColumn = { bg = "None" },
					CursorLine = { bg = "None" },
					CursorColumn = { bg = "None" },
					VertSplit = { bg = "None" },
				},
			})
		end,
	},
}
