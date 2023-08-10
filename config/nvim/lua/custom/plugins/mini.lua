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
}
