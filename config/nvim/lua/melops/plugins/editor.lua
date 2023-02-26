return {
 	-- which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register({
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["\\"] = { name = "+launch" },
				["<leader>g"] = { name = "+git" },
				["<leader>h"] = { name = "+hunks" },
				["<leader>f"] = { name = "+find" },
				["<leader>m"] = { name = "+mergetool" },
				["<leader>n"] = { name = "+neorg" },
			})
		end,
	},
	-- harpoon
	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>fa", "<cmd> lua require('harpoon.mark').add_file()<cr>", desc = "Add file to harpoon" },
			{ "<leader>fm", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon menu" },
			{ "<leader>fN", "<cmd> lua require('harpoon.ui').nav_next()<cr>", desc = "Navigate to next file" },
			{ "<leader>fP", "<cmd> lua require('harpoon.ui').nav_prev()<cr>", desc = "Navigate to prev file" },
			{ "<leader>1", "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", desc = "Navigate to file 1" },
			{ "<leader>2", "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", desc = "Navigate to file 2" },
			{ "<leader>3", "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", desc = "Navigate to file 3" },
			{ "<leader>4", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", desc = "Navigate to file 4" },
		},
	},
	-- references
	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
					pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
				end,
			})
		end,
		-- stylua: ignore
		keys = {
			{ "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
			{ "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
		},
	},
  {
    "norcalli/nvim-colorizer.lua",
    config = true
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "cl"
      },
      opleader = {
          line = "cl"
      }
      })
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>u",
        function()
          vim.cmd("UndotreeToggle")
        end,
        desc = "undotree"
      }
    }
  },
  { "christoomey/vim-tmux-navigator"},
  {"nathom/filetype.nvim"},
  {"tpope/vim-surround"},
  {"sbdchd/neoformat"},
  {
		"voldikss/vim-floaterm",
		config= true
	},
}
