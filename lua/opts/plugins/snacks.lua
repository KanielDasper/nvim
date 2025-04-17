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
			image = { enabled = false },
			quickfile = { enabled = true },
			-- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
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
					-- override picker layout in keymaps function as a param below
					preset = "default", -- defaults to this layout unless overidden
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
				"<leader>.",
				function()
					vim.ui.input({
						prompt = "Enter scratch buffer title: ",
						default = "",
					}, function(t)
						if not vim.fn.isdirectory(scratch_path) then
							vim.fn.mkdir(scratch_path, "p")
						end

						local title = t ~= "" and t:gsub("%s+", "_") or "Untitled"
						require("snacks").scratch.open({
							ft = "markdown",
							name = title .. "_" .. os.date("%Y-%m-%d-%H-%M-%S"),
							win = {
								title = title,
							},
						})
					end)
				end,
			},
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
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
					require("snacks").picker.files({ cwd = "~/Documents/Vimwiki/", layout = "ivy" })
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
				"<leader>vh",
				function()
					require("snacks").picker.help({ layout = "ivy" })
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
	-- NOTE: todo comments w/ snacks
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		optional = true,
		keys = {
			{
				"<leader>ft",
				function()
					require("snacks").picker.todo_comments({ layout = "ivy" })
				end,
				desc = "Todo",
			},
		},
	},
}
