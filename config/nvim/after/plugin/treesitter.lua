local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("Could not find treesitter");
    return
end
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
treesitter.setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
        "bash",
        "css",
        "fish",
        "go",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_line",
        "norg",
        "php",
        "python",
        "rust",
        "toml",
        "typescript",
        "yaml",
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" }, -- benifit from Obsidian.nvim's extra syntax improvements
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>"
        }
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer"
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer"
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer"
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer"
            }
        }
    }
}

