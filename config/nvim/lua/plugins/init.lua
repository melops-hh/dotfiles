return {
  { -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    event = 'VeryLazy',
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { 'prettier' },
      },
    },
  },

  { -- Catppuccin colorscheme
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-latte'
    end,
  },

  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  {
    'otavioschwanck/arrow.nvim',
    evet = 'VeryLazy',
    opts = {
      show_icons = true,
      leader_key = ';', -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    },
  },

  {
    'voldikss/vim-floaterm',
    keys = {
      { '<leader>lz', '<cmd> FloatermNew --width=1.00 --height=1.00 lazygit<CR>', mode = 'n', desc = 'Toggle lazygit' },
    },
  },

  {
    'folke/zen-mode.nvim',
    opts = {
      plugins = {
        options = {
          enabled = true,
          laststatus = 3,
        },
      },
    },
    keys = {
      { '<leader>zz', '<cmd>ZenMode<CR>', desc = 'Toggle ZenMode' },
    },
  },

  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  {
    'github/copilot.vim',
    event = 'VeryLazy',
    config = function()
      vim.g.copilot_enabled = false
    end,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    keys = {
      {
        '<leader>snl',
        function()
          require('noice').cmd 'last'
        end,
        desc = 'Noice Last Message',
      },
      {
        '<leader>snh',
        function()
          require('noice').cmd 'history'
        end,
        desc = 'Noice History',
      },
      {
        '<leader>sna',
        function()
          require('noice').cmd 'all'
        end,
        desc = 'Noice All',
      },
      {
        '<leader>snd',
        function()
          require('noice').cmd 'dismiss'
        end,
        desc = 'Dismiss All',
      },
    },
  },

  {
    'nvim-tree/nvim-tree.lua',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<C-b>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
      { '<C-n>', '<cmd>NvimTreeFindFile<CR>', desc = 'Find file in NvimTree' },
    },
  },

  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },

  { -- Tmux navigation
    'christoomey/vim-tmux-navigator',
  },
}
