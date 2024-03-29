-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- global scope settings
-- Set highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.cursorline = true -- Highlight the text line of the cursor with CursorLine

vim.o.syntax = 'on'
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- window scope settings

-- Make line numbers default
vim.wo.number = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

vim.wo.relativenumber = true -- Show the line number relative to the currentline
vim.wo.signcolumn = "yes:2" -- always deaw signcolumn
vim.wo.wrap = false
vim.wo.colorcolumn = "90"
-- vim.wo.scrolloff = 8
-- vim.wo.sidescrolloff = 8
