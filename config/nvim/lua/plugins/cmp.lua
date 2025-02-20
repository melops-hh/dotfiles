return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp',
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        {
          'giuxtaposition/blink-cmp-copilot',
        },
        {
          'Kaiser-Yang/blink-cmp-dictionary',
          dependencies = { 'nvim-lua/plenary.nvim' },
        },
      },
    },

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },
      completion = {
        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, window = { border = 'single' } },
        list = { selection = { preselect = false, auto_insert = true } },
        menu = {
          auto_show = function(ctx)
            -- Don't show completion for search or cmd
            return ctx.mode ~= 'cmdline' or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
          end,
        },
      },

      appearance = {
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
        kind_icons = {
          Copilot = '',
          Text = '󰉿',
          Method = '󰊕',
          Function = '󰊕',
          Constructor = '󰒓',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '󱡠',
          Interface = '󱡠',
          Struct = '󱡠',
          Module = '󰅩',

          Unit = '󰪚',
          Value = '󰦨',
          Enum = '󰦨',
          EnumMember = '󰦨',

          Keyword = '󰻾',
          Constant = '󰏿',

          Snippet = '󱄽',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '󰉋',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'copilot', 'dictionary' },
        providers = {
          lsp = {
            name = 'lsp',
            enabled = true,
            module = 'blink.cmp.sources.lsp',
            score_offset = 100,
          },
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            async = true,
            score_offset = 10,
            transform_items = function(_, items)
              local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = 'Copilot'
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
          lazydev = {
            name = 'LazyDev',
            enabled = true,
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 90,
          },
          dictionary = {
            -- make sure wordnet ($wn) is installed
            module = 'blink-cmp-dictionary',
            enabled = true,
            name = 'Dict',
            min_keyword_length = 3,
            max_items = 8,
            score_offset = 20,
            --- @module 'blink-cmp-dictionary'
            --- @type blink-cmp-dictionary.Options
            opts = {
              get_command = 'rg',
              get_command_args = function(prefix)
                return {
                  '--color=never',
                  '--no-line-number',
                  '--no-messages',
                  '--no-filename',
                  '--ignore-case',
                  '--',
                  prefix,
                  vim.fn.expand '~/Repos/melops/dotfiles/dictionaries/words',
                }
              end,
            },
          },
        },
      },
      snippets = {
        preset = 'luasnip',
      },
      signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
}
