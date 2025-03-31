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

  {
    'echasnovski/mini.operators',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'echasnovski/mini.diff',
    event = 'VeryLazy',
    opts = {
      view = {
        style = 'sign',
        signs = {
          add = '+',
          change = '~',
          delete = '_',
        },
      },
    },
  },

  { -- Minimal and fast autopairs
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'echasnovski/mini.hipatterns',
    event = 'VeryLazy',
    config = function()
      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },
}
