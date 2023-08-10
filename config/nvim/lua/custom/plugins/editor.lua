return {
	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = true,
		opts = {
			direction = "float",
			close_on_exit = true,
			float_opts = { border = "curved" },
		},
		-- keys = {
		-- 	{ "<leader>tt", "<cmd> lua require('toggleterm.terminal').Terminal:new { direction = 'float' }:toggle()<cr>", desc = "Toggle terminal" },
		-- },
	},
	-- harpoon
	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>fa", "<cmd> lua require('harpoon.mark').add_file()<cr>",        desc = "Add file to harpoon" },
			{ "<leader>fm", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon menu" },
			{ "<leader>fN", "<cmd> lua require('harpoon.ui').nav_next()<cr>",          desc = "Navigate to next file" },
			{ "<leader>fP", "<cmd> lua require('harpoon.ui').nav_prev()<cr>",          desc = "Navigate to prev file" },
			{ "<leader>1",  "<cmd> lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Navigate to file 1" },
			{ "<leader>2",  "<cmd> lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Navigate to file 2" },
			{ "<leader>3",  "<cmd> lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Navigate to file 3" },
			{ "<leader>4",  "<cmd> lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Navigate to file 4" },
		},
	},
}
