-- codeium status function
local function codeium()
	local status = vim.api.nvim_call_function("codeium#GetStatusString", {}):lower():gsub("%s+", "")
	local status_color
	local display_text

	-- codeium status logic
	if status == "on" then
		status_color = "%#LualineAIOn#"
		display_text = "󰚩 ON"
	elseif status == "off" then
		status_color = "%#LualineAIOff#"
		display_text = "󰚩 OFF" --
	elseif status:match("^%d+/%d+$") then
		status_color = "%#LualineAIOn#"
		display_text = "󰚩 " .. status
	elseif status == "0" then
		status_color = "%#LualineAIOff#"
		display_text = "󰚩 No suggestions"
	elseif status == "*" then
		status_color = "%#LualineAIOff#"
		display_text = "󰚩 Waiting..."
	else
		status_color = "%#LualineAIOff#"
		display_text = "󰚩 Unknown"
	end

	return string.format("%s%s%%#Normal#", status_color, display_text)
end

-- Lualine config
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = {},
				section_separators = {},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename", codeium },
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
		-- Green and read for colors
		vim.cmd([[highlight LualineAIOn guifg=#9ece6a guibg=NONE]])
		vim.cmd([[highlight LualineAIOff guifg=#f7768e guibg=NONE]])
	end,
}
