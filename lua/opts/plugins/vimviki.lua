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
			pattern = "diary/*.md",
			command = "0r! ~/.vim/vimwiki-diary-tpl.py '%'"
		})
	end,
}
