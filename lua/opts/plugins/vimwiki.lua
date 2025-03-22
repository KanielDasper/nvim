return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Documents/Vimwiki/",
				syntax = "markdown",
				ext = ".md",
				auto_toc = 1,
				index = "index",
				auto_diary_index = 1,
			},
		}
		vim.g.vimwiki_use_calendar = 1

		-- Autocmd for diary template
		vim.api.nvim_create_autocmd("BufNewFile", {
			pattern = "*/diary/*.md",
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				if vim.api.nvim_buf_line_count(bufnr) == 1 and vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] == "" then
					local date = os.date("%Y-%m-%d")
					local template = {
						"# " .. date,
						"Back to [Diary Index](Diary)",
						"",
						"## Todo",
						"",
						"* [ ]",
						"",
						"## Notes",
						""
					}
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, template)
				end
			end,
		})
	end,
}
