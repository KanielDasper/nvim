return {
	"j-morano/buffer_manager.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local opts = { noremap = true }
		local keymap = vim.keymap.set
		local buffer_manager = require("buffer_manager")
		-- Setup
		buffer_manager.setup({
			select_menu_item_commands = {
				v = {
					key = "<C-v>",
					command = "vsplit",
				},
			},
			height = 0.4,
			width = 0.6,
			show_indicators = "after",
			focus_alternate_buffer = false,
			short_file_names = true,
			short_term_names = true,
			loop_nav = false,
			highlight = "Normal:BufferManagerBorder",
			win_extra_options = {
				winhighlight = "Normal:BufferManagerNormal",
			},
		})
		-- Navigate buffers bypassing the menu using keys
		local keys = "1234567890"
		local bmui = require("buffer_manager.ui")
		for i = 1, #keys do
			local key = keys:sub(i, i)
			keymap("n", string.format("<leader>%s", key), function()
				bmui.nav_file(i)
			end, opts)
		end
		-- Just the menu
		keymap({ "t", "n" }, "<leader><leader>", bmui.toggle_quick_menu, opts)

		-- autocmd for moving buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "buffer_manager",
			callback = function()
				-- Move buffers up and down in the number select menu
				keymap("n", "J", ":m .+1<cr>==", { buffer = true, silent = true })
				keymap("n", "K", ":m .-2<CR>==", { buffer = true, silent = true })
			end,
			-- Highlight green for modified
			vim.api.nvim_set_hl(0, "BufferManagerModified", { fg = "#b9f27c" }),
		})
	end,
}
