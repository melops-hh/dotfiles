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
	},
}
