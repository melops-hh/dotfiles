return {
	{
		"navarasu/onedark.nvim",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
				priority = 1000, -- make sure to load this before all the other start plugins
				config = function()
					vim.cmd("colorscheme onedark")
				end,
	},
		{
			"nvim-lualine/lualine.nvim",
			opts = {
				options = {
					icons_enabled = true,
					theme = "onedark"
				},
				sections = {
					lualine_a = {{
						"filename",
						path = 1
					}}
				}
			}
		},
		{
			"folke/zen-mode.nvim",
			config = true
		},
		{'nvim-tree/nvim-web-devicons'},
		{
			'nvim-tree/nvim-tree.lua',
			config=true,
			keys = {
				{
					"<C-b>",
					function()
						local cwd = vim.fn.expand("%:p:h")
						require("nvim-tree").toggle(false, true, cwd)
					end,
					desc = 'nvim-tree'
				}
			}
		},
		{
			"folke/zen-mode.nvim",
			config = function()
				require("zen-mode").setup {
					window = {
						width = .80 -- width will be 85% of the editor width
					},
					plugins = {
						tmux = { enabled = false }
					},
					options = {
						number = true,
						relativenumber = true,
					}
				}
			end,
			keys = {
				{
					"<leader>zz",
					function()
						require("zen-mode").toggle()
						vim.wo.wrap = false
					end,
					desc = "zen-mode"
				}
			}
		},
		-- better diagnostics list and others
		{
			"folke/trouble.nvim",
			cmd = { "TroubleToggle", "Trouble" },
			opts = { use_diagnostic_signs = true },
			keys = {
				{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
				{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			},
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			opts = {
				char = "┊",
				show_trailing_blankline_indent = false
			}
		},
		{"tpope/vim-sleuth"},
		{"voldikss/vim-floaterm"}
}
