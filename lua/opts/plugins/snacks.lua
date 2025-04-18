-- plugins/snacks.lua
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		image = { enabled = true },
		picker = {
			enabled = true,
			formatters = {
				file = {
					filename_first = false,
					filename_only = false,
					icon_width = 2,
				},
			},
			layout = {
				preset = "default",
			},
		},
		dashboard = {
			enabled = true,
			preset = {
				header = [[
      ;,    .,,   ,,;,                     ,,
     '||:   :||||;;;::;           ,,,      ;|;
     ,||,;;, ||     ||            '|||     ||'
 ;|||;||;;'' ||||||;||            ,||    ,||' ,,,|||,
  '''|||;,,  ||''   ||            ||',, ,|'||||' ,|||'
   ,|;||'|;; ||||||;||           ,||||| '    ||  ''
  ;;':||  '';||''   ||     ,,|||'|| ||'      ||
.''  :|;    :|||||;;;'     '|''  |,,|'   ,   ||  '||,
   , .'' .,,  '''.,,             ,|||,  ||   ||   '|||
  || |;   ';|;,   '||;,          ,|||, :||;  ||   '|||
 ;|| '|;    ';;:   '|;;;      ,||'' |||'||'  ||     ||
 :||  '|;,         ., ''      ''     '' ' ,,,||
  ''   '|;;:,,,,,,,,||,                    '|||
          ''::::::::''                      '''
        ]],
			},
		},
		sections = {
			{ section = "header" },
		},
	},
	keys = {
		--HACK: Git
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>ll",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Logs",
		},
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branch Picker",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},

		--HACK: Pickers
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.files({ cwd = "~/Documents/Vimwiki/" })
			end,
			desc = "Find Vimwiki File",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Word",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Selection/Word",
			mode = { "n", "x" },
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps({ layout = "select" })
			end,
			desc = "Keymaps Picker",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fi",
			function()
				Snacks.picker.icons()
			end,
			desc = "Choose icons",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},

		--HACK: Utilities
		{
			"<localleader>rf",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<esc><esc>",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd

				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
