return {
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
      -- { '<leader>gs', '<cmd>G<cr>', desc = '[G]it [S]tatus' },
      -- { '<leader>gc', '<cmd>G commit<cr>', desc = '[G]it [C]ommit' },
      -- { '<leader>gC', '<cmd>G commit --amend --no-edit<cr>', desc = '[G]it [C]ommit amend no edit' },
      -- { '<leader>gf', '<cmd>G fetch origin<cr>', desc = '[G]it [F]etch origin' },
      -- { '<leader>gp', '<cmd>G pull<cr>', desc = '[G]it [P]ull' },
      -- { '<leader>gP', '<cmd>G push --force-with-lease<cr>', desc = '[G]it [P]ush (force)' },
      -- { '<leader>gl', '<cmd>G log<cr>', desc = '[G]it [L]og' },
      { '<leader>gh', '<cmd>G log --stat %<cr>', desc = '[G]it log stat' },
      -- { '<leader>gd', '<cmd>G diff %<cr>', desc = '[G]it [D]iff (file)' },
      { '<leader>gD', '<cmd>G diff<cr>', desc = '[G]it [D]iff (workspace)' },
      { '<leader>gbl', '<cmd>G blame<cr>', desc = '[G]it [B]lame' },
      { 'gf', '<cmd>diffget //3<cr>', desc = '[G]it diff get (base)' },
      { 'gh', '<cmd>diffget //2<cr>', desc = '[G]it diff get (head)' },
    },
  },

  { -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>do', '<cmd>DiffviewOpen<cr>', desc = '[D]iffview [O]pen' },
      { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = '[D]iffview [C]lose' },
      { '<leader>dfh', '<cmd>DiffviewFileHistory %<cr>', desc = '[D]iffview [F]ile [H]istory' },
    },
  },
}
