-- lua/plugins/python-lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- if you use Pyright
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true, -- ← enables auto-imports in completion
                diagnosticMode = "workspace", -- ← index whole repo (not only open files)
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic", -- or "strict"
              },
              venvPath = ".",
              venv = ".venv",
            },
          },
        },

        -- If you switch to BasedPyright instead of Pyright, use this block
        -- basedpyright = {
        --   settings = {
        --     basedpyright = {
        --       analysis = {
        --         autoImportCompletions = true,
        --         diagnosticMode = "workspace",
        --         autoSearchPaths = true,
        --       },
        --     },
        --   },
        -- },
      },
    },
  },
}
