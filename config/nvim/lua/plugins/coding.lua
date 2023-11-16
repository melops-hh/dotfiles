return {
	-- testing
	{
		"vim-test/vim-test",
		event = "VeryLazy",
		config = function()
			local tt = require("toggleterm")
			local ttt = require("toggleterm.terminal")

			vim.g["test#custom_strategies"] = {
				tterm = function(cmd)
					tt.exec(cmd)
				end,

				tterm_close = function(cmd)
					local term_id = 0
					tt.exec(cmd, term_id)
					ttt.get_or_create_term(term_id):close()
				end,
			}

			vim.g["test#strategy"] = "tterm"
			vim.g["test#python#pytest#options"] = "-vv"
		end,
		keys = {
			{ "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test closest" },
			{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
			{ "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test suite" },
			{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
			{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
		},
	},

  {'tpope/vim-fugitive',
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
      { "gf", "<cmd>diffget //3<cr>", desc = "Git diff get (base)" },
      { "gh", "<cmd>diffget //2<cr>", desc = "Git diff get (head)" },
    }
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
        vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      -- "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

}
