return {
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs', '<cmd>G<cr>', desc = 'Git status' },
      { '<leader>gc', '<cmd>G commit<cr>', desc = 'Git commit' },
      { '<leader>gf', '<cmd>G fetch origin<cr>', desc = 'Git fetch origin' },
      { '<leader>gp', '<cmd>G pull<cr>', desc = 'Git pull' },
      { '<leader>gP', '<cmd>G push --force-with-lease<cr>', desc = 'Git push (force)' },
      { '<leader>gl', '<cmd>G log<cr>', desc = 'Git log' },
      { '<leader>gh', '<cmd>G log --stat %<cr>', desc = 'Git log stat' },
      { '<leader>gd', '<cmd>G diff %<cr>', desc = 'Git diff (file)' },
      { '<leader>gD', '<cmd>G diff<cr>', desc = 'Git diff (workspace)' },
      { '<leader>gb', '<cmd>G blame<cr>', desc = 'Git blame' },
      { 'gf', '<cmd>diffget //3<cr>', desc = 'Git diff get (base)' },
      { 'gh', '<cmd>diffget //2<cr>', desc = 'Git diff get (head)' },
    },
  },

  { -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    'sindrets/diffview.nvim',
  },

  {
    'dlvhdr/gh-blame.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
    keys = {
      { '<leader>gg', '<cmd>GhBlameCurrentLine<cr>', desc = 'GitHub Blame Current Line' },
    },
  },

  { -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  },
}
