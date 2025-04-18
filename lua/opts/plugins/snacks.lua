local scratch_path = os.getenv("HOME") .. "/notes/scratch"

return {
	-- HACK: docs @ https://github.com/folke/snacks.nvim/blob/main/docs
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		-- NOTE: Options
		opts = {
			explorer = { enabled = true },
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
					-- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
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
			scratch = {
				enabled = true,
			},
		},
		-- NOTE: Keymaps
		keys = {
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>ll",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<localleader>rf",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast Rename Current File",
			},

			-- Snacks Picker
			{
				"<leader>ff",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files (Snacks Picker)",
			},
			{
				"<leader>fc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>fw",
				function()
					require("snacks").picker.files({ cwd = "~/Documents/Vimwiki/" })
				end,
				desc = "Find Vimwiki File",
			},
			{
				"<leader>fg",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep word",
			},
			{
				"<leader>fs",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Search Visual selection or Word",
				mode = { "n", "x" },
			},
			{
				"<leader>fk",
				function()
					require("snacks").picker.keymaps({ layout = "select" })
				end,
				desc = "Search Keymaps (Snacks Picker)",
			},

			-- Git Stuff
			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Pick and Switch Git Branches",
			},

			-- Other Utils
			{
				"<leader>fh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>z",
				function()
					require("snacks").zen()
				end,
				desc = "Toggle Zen Mode",
			},
		},
	},
}
