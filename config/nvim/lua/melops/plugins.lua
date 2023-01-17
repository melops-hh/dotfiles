-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Unable to load packer")
    return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- Theme inspired by Atom
    use("navarasu/onedark.nvim")
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = { -- LSP Support
        {"neovim/nvim-lspconfig"}, {"williamboman/mason.nvim"}, {"williamboman/mason-lspconfig.nvim"},
        -- Autocompletion
        {"hrsh7th/nvim-cmp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"saadparwaiz1/cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-nvim-lua"}, -- Snippets
        {"L3MON4D3/LuaSnip"}, {"rafamadriz/friendly-snippets"}}
    })
    use {
        "zbirenbaum/copilot.lua",
        event = "VimEnter",
        config = function()
            vim.defer_fn(function()
                require("copilot").setup({
                    suggestions = {
                        enabled = true,
                        auto_trigger = true
                    }
                })
            end, 100)
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    }
    -- Highlight, edit, and navigate code
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require("nvim-treesitter.install").update {
                with_sync = true
            })
        end
    })
    -- Additional text objects via treesitter
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter"
    })
    -- Fuzzy Finder (files, lsp, etc)
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {"nvim-lua/plenary.nvim"}
    })
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = vim.fn.executable "make" == 1
    })
    -- Tmux navigation
    use("christoomey/vim-tmux-navigator")
    -- Statusline
    use("nvim-lualine/lualine.nvim")
    -- Git signs
    use("lewis6991/gitsigns.nvim")
    -- Add indentation guides even on blank lines
    use("lukas-reineke/indent-blankline.nvim")
    -- Commenting
    use("numToStr/Comment.nvim")
    -- Detect tabstop and shiftwidth automatically
    use("tpope/vim-sleuth")
    use("voldikss/vim-floaterm")
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
    })
    use("theprimeagen/harpoon")
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    use("nathom/filetype.nvim")
    use("lewis6991/impatient.nvim")
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    })
    use("norcalli/nvim-colorizer.lua")
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('epwalsh/obsidian.nvim')
    use('godlygeek/tabular')
    use('preservim/vim-markdown')
    use('tpope/vim-surround')
    use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

    use({
        "nvim-neorg/neorg",
        ft = "norg",
        after = "nvim-treesitter", -- You may want to specify Telescope here as well
        config = function()
            require("melops.config.neorg")
        end,
    })

end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end
