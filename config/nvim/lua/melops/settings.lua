-- global variables
vim.g.mapleader = " " -- Set <space> as the leader key
vim.g.maplocalleader = " " -- Set <space> as the leader key
vim.g.netrw_banner = 0 -- surpress the banner
vim.g.netrw_keepdir = 0 -- keep current directory and browsing directory synced
vim.g.netrw_liststyle = 3 -- ide like 
vim.g.netrw_winsize = 15 -- set initial window size to 15%

-- global scipe settings
vim.o.breakindent = true -- Enable break indent
vim.o.clipboard = "unnamedplus" -- copy to system clipboard
vim.o.completeopt = "menu,menuone,noselect" -- Set completeopt to have a better completion experience
vim.o.cursorline = true -- Highlight the text line of the cursor with CursorLine
vim.o.hlsearch = false -- Set highlight on search
vim.o.ignorecase = true
vim.o.mouse = "a" -- Enable mouse mode
vim.o.smartcase = true
vim.o.syntax = "on"
vim.o.termguicolors = true
vim.o.undofile = true -- Save undo history
vim.o.updatetime = 50 -- Decrease update time

-- window scope settings
vim.wo.number = true -- Make line numbers default
vim.wo.relativenumber = true -- Show the line number relative to the currentline
vim.wo.signcolumn = "yes" -- always deaw signcolumn
