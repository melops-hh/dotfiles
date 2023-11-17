return {
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},

	{
		"echasnovski/mini.bracketed",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.bracketed").setup(opts)
		end,
	},

	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},

	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("mini.comment").setup({
				mappings = {
					comment = 'cl',
					comment_line = 'cl',
					comment_visual = 'cl',
				}
			})
		end,
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
				end,
			},
		},
	},

	-- Active indent guide and indent text objects. When you're browsing
	-- code, this highlights the current level of indentation, and animates
	-- the highlighting.
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
