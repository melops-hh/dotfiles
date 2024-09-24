return {
  { -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup()
    end,
  },

  { -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    config = function()
      require('mini.surround').setup()
    end,
  },

  { -- Go forward/backward with square brackets
    'echasnovski/mini.bracketed',
    event = 'VeryLazy',
    config = function()
      require('mini.bracketed').setup()
    end,
  },

  { -- Navigate and manipulate file system
    'echasnovski/mini.files',
    event = 'VeryLazy',
    config = function()
      require('mini.files').setup()
    end,
    keys = {
      { '<leader>mf', ':lua MiniFiles.open()<CR>', desc = '[M]ini [F]iles', { noremap = true } },
    },
  },

  {
    -- Jump to next/previous single character
    'echasnovski/mini.jump',
    event = 'VeryLazy',
    config = function()
      require('mini.jump').setup {
        mappings = {
          -- disable repeat_jump because it is used by arrow.nvim
          repeat_jump = '',
        },
      }
    end,
  },

  {
    -- Simple and easy statusline.
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    config = function()
      local statusline = require 'mini.statusline'

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_filename = function()
        -- Set filepath: '%' -> relative path, '%:t' -> tail (filename only)
        return vim.fn.expand '%'
      end
    end,
  },
}
