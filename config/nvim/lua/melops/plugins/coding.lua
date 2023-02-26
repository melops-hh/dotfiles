return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        -- LSP Support
        {"neovim/nvim-lspconfig"}, {"williamboman/mason.nvim"}, {"williamboman/mason-lspconfig.nvim"},
        -- Autocompletion
        {"hrsh7th/nvim-cmp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"saadparwaiz1/cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-nvim-lua"}, 
        -- Snippets
        {"L3MON4D3/LuaSnip"}, {"rafamadriz/friendly-snippets"}
    }
  },
  {  
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
        vim.defer_fn(function()
            require("copilot").setup({
                suggestions = {
                    enabled = true,
                    auto_trigger = true
                }
            })
        end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
        require("copilot_cmp").setup()
    end
  },
  	-- git
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", "<cmd>G<cr>", desc = "Git status" },
			{ "<leader>gc", "<cmd>G commit<cr>", desc = "Git commit" },
			{ "<leader>gf", "<cmd>G fetch origin<cr>", desc = "Git fetch origin" },
			{ "<leader>gp", "<cmd>G pull<cr>", desc = "Git pull" },
			{ "<leader>gP", "<cmd>G push --force-with-lease<cr>", desc = "Git push (force)" },
			{ "<leader>gl", "<cmd>G log<cr>", desc = "Git log" },
			{ "<leader>gh", "<cmd>G log --stat %<cr>", desc = "Git log stat" },
			{ "<leader>gd", "<cmd>G diff %<cr>", desc = "Git diff (file)" },
			{ "<leader>gD", "<cmd>G diff<cr>", desc = "Git diff (workspace)" },
			{ "<leader>gb", "<cmd>G blame<cr>", desc = "Git blame" },
		},
	},
	-- git mergetool
	{
		"akinsho/git-conflict.nvim",
		event = "VeryLazy",
		config = true,
		opts = {
			default_mappings = false,
			highlights = {
				incoming = "DiffAdd",
				current = "DiffChange",
			},
		},
		keys = {
			{ "<leader>mo", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose ours (current)" },
			{ "<leader>mt", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose theirs (incoming)" },
			{ "<leader>mb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose both" },
			{ "<leader>mn", "<cmd>GitConflictChooseNone<cr>", desc = "Choose none" },
			{ "<leader>m]", "<cmd>GitConflictNextConflict<cr>", desc = "Move to next conflict" },
			{ "<leader>m[", "<cmd>GitConflictPrevConflict<cr>", desc = "Move to prev conflict" },
			{ "<leader>ml", "<cmd>GitConflictListQf<cr>", desc = "List merge conflicts" },
		},
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
        add = {text = "+"},
        change = {text = "~"},
        delete = {text = "_"},
        topdelete = {text = "‾"},
        changedelete = {text = "~"},
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				-- stylua: ignore start
				map("n", "<leader>h]", gs.next_hunk, "Next Hunk")
				map("n", "<leader>h[", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>hd", gs.diffthis, "Diff This")
				map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This ~")
			end,
		},
	}
}
