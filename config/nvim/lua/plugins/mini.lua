return {
  { -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    opts = {},
  },

  { -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    opts = {},
  },

  { -- Go forward/backward with square brackets
    'echasnovski/mini.bracketed',
    event = 'VeryLazy',
    opts = {},
  },

  { -- Navigate and manipulate file system
    'echasnovski/mini.files',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<leader>mf', ':lua MiniFiles.open()<CR>', desc = '[M]ini [F]iles', { noremap = true } },
    },
  },

  {
    -- Jump to next/previous single character
    'echasnovski/mini.jump',
    event = 'VeryLazy',
    opts = {
      mappings = {
        -- disable repeat_jump because it is used by arrow.nvim
        repeat_jump = '',
      },
    },
  },

  { -- Minimal and fast statusline module with opinionated default look
    'echasnovski/mini.statusline',
    event = 'VeryLazy',
    opts = {},
  },

  { -- Minimal and fast autopairs
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
  },
}
