-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- local mark = require('harpoon.mark')
-- local ui = require('harpoon.ui')
return {
	-- Tmux navigation
	"christoomey/vim-tmux-navigator",
	"voldikss/vim-floaterm",
	{"folke/zen-mode.nvim",
		opts = {
			window = {
				width = .80
			},
			plugins = {
				tmux = {enabled = false},
				alacritty = {
					enabled = false,
					font = "14", -- font size
				},
			},
			options = {
				number =true,
				relativenumber =true
			}
		},
		keys = {
			{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zendmode" }
		}
	},
	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>ft", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
			{ "<leader>fT", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
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
	-- git mergetool
	-- {
	-- 	"akinsho/git-conflict.nvim",
	-- 	event = "VeryLazy",
	-- 	version = "v1.1.2",
	-- 	config = true,
	-- 	opts = {
	-- 		default_mappings = true,
	-- 		highlights = {
	-- 			incoming = "DiffAdd",
	-- 			current = "DiffChange",
	-- 		},
	-- 	},
	-- },
	-- simple notifier
	{'sindrets/diffview.nvim'},
	{
		"vigoux/notifier.nvim",
		event = "VeryLazy",
		config = true,
	},
	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{ "nvim-tree/nvim-tree.lua",
		opts = {
			filters = {
				dotfiles = true,
			},
		},
		keys = {
			{ "<C-n>", "<cmd>NvimTreeFindFile<cr>",  desc = "[N]vim tree toggle" },
		}
	},
	-- icons
	{ "nvim-tree/nvim-web-devicons" },

	-- ui components
	{ "MunifTanjim/nui.nvim" },
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			-- { "<C-b>", "<cmd> lua require('oil').open<cr>", desc = "Open parent directory" },
		}
	},
	'sbdchd/neoformat',
	{ 'pwntester/octo.nvim', opts = {}, cmd = "Octo" },
	{'github/copilot.vim'},
	{'nvim-treesitter/nvim-treesitter-context'},

}
