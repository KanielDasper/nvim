return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                    disable = {}
                },
                modules = {},
                -- enable indentation
                indent = { enable = true },

                -- Ignore these languages
                ignore_install = {},

                auto_install = true,
                sync_install = false,

                -- ensure these languages parsers are installed
                ensure_installed = {
                    "json",
                    "yaml",
                    "html",
                    "css",
                    "python",
                    "http",
                    "markdown",
                    "markdown_inline",
                    "graphql",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "query",
                    "vimdoc",
                    "c",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                    },
                },
                additional_vim_regex_highlighting = false,
            })
        end,
    },
}
