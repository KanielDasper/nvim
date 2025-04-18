return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		-- Import completion capabilities from blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- Diagnostic signs
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		-- Autocmd for keymaps

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings
				-- Check `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap.set

				opts.desc = "Go to LSP references in buffer"
				keymap("n", "gr", "<cmd>Trouble lsp_references toggle filter.buf=0<CR>", opts)

				opts.desc = "Go to LSP references"
				keymap("n", "gR", "<cmd>Trouble lsp_references toggle<CR>", opts)

				opts.desc = "Go to declaration"
				keymap("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP diagnostics"
				keymap("n", "<leader>dd", "<cmd>Trouble diagnostics filter.buf=0<CR>", opts)

				opts.desc = "Show LSP workspace diagnostics"
				keymap("n", "<leader>xx", "<cmd>Trouble diagnostics<CR>", opts)

				opts.desc = "Show LSP definitions"
				keymap("n", "gd", "<cmd>Trouble lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap("n", "gi", "<cmd>Trouble lsp_implementations<CR>", opts)

				-- opts.desc = "Show LSP type definitions"
				-- keymap("n", "gt", "<cmd>Trouble lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions, only applied selection in visual mode"
				keymap({ "n", "v" }, "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, opts)

				opts.desc = "LSP intelligent rename symbol"
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show documentation on hover"
				keymap("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP server"
				keymap("n", "<leader>rs", ":LspRestart<CR>", opts)

				keymap("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})

		-- NOTE: If using Blink.cmp Configure all LSPs here

		-- Configure lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		-- Configure pyright
		lspconfig.pyright.setup({
			capabilities = capabilities,
			root_files = {
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				"pyrightconfig.json",
				".git",
				".venv",
			},
			cmd = { "pyright-langserver", "--stdio" },
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})
		-- Add other LSP servers as needed, e.g., gopls, clangd, html, etc.
	end,
}
