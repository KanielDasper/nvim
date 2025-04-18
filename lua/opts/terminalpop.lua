-- Terminal Float State (taught by tj)
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		relative = "editor",
		border = "rounded",
		style = "minimal",
		width = width,
		height = height,
		col = col,
		row = row,
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

local pop_terminal = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()

			-- Get the virtual environment path
			local virtual_env = vim.fn.getenv("VIRTUAL_ENV")
			if virtual_env and virtual_env ~= vim.NIL and virtual_env ~= "" then
				local activate_script = virtual_env .. "/bin/activate"
				vim.api.nvim_chan_send(
					vim.bo[state.floating.buf].channel,
					"clear && source " .. activate_script .. "\n"
				)
			end
		end

		-- Start float terminal in insert mode
		vim.api.nvim_set_current_win(state.floating.win)
		vim.cmd("startinsert!")
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command("Terminalpop", pop_terminal, {})

-- Two keymaps just because its nice that spacebar gets triggered properly when writing in terminal
vim.keymap.set({ "n" }, "<leader>t", pop_terminal)
vim.keymap.set({ "t", "n" }, "<localleader><esc>", pop_terminal)
