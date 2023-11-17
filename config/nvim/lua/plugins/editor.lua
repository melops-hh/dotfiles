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
  -- {
  --   'wittyjudge/gruvbox-material.nvim',
  --     config = function()
  --     vim.cmd.colorscheme 'gruvbox-material'
  --   end,
  -- },
  -- harpoon
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>fa", "<cmd> lua require('harpoon.mark').add_file()<cr>",        desc = "Add file to harpoon" },
      { "<leader>fm", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon menu" },
      { "<leader>fN", "<cmd> lua require('harpoon.ui').nav_next()<cr>",          desc = "Navigate to next file" },
      { "<leader>fP", "<cmd> lua require('harpoon.ui').nav_prev()<cr>",          desc = "Navigate to prev file" },
      { "<leader>j",  "<cmd> lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Navigate to file 1" },
      { "<leader>k",  "<cmd> lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Navigate to file 2" },
      { "<leader>l",  "<cmd> lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Navigate to file 3" },
      { "<leader>;",  "<cmd> lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Navigate to file 4" },
    },
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
	load = {
	  ["core.defaults"] = {}, -- Loads default behaviour
	  ["core.keybinds"] = {
	    config = {
	      default_keybinds = true, -- Generate the default keybinds
	    }
	  },
	  ["core.concealer"] = {
	    config = {
	      markup_preset = "conceal",
	      icon_preset = "diamond",
	      folds = false,
	    },
	  }, -- Adds pretty icons to your documents
	  ["core.dirman"] = { -- Manages Neorg workspaces
	    config = {
	      autochdir = false,
	      workspaces = {
		melops = "~/notes",
		notes = "~/notes",
		raise = "~/Repos/melops/raise"
	      },
	      default_workspace = 'notes'
	    },
	  },
	  ["core.export.markdown"] = {
	    config = {
	      extensions = "all",
	    },
	  },
	  ["core.completion"] = {
	    config = {
	      engine = "nvim-cmp",
	    },
	  },
	},
      }
      -- set concealer and fold level for neorg
      vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = { "norg" },
	command = [[setlocal wrap linebreak conceallevel=3 concealcursor=nc foldlevel=1]],
      })
    end,
  },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {{
            "filename",
            path = 1
        }}
      }
    },
  },
}
