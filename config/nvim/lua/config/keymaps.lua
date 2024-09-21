-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- map kj to ESC
vim.keymap.set('i', 'kj', '<ESC>', { silent = true })

-- switch between current and last buffer
vim.keymap.set('n', '<leader>.', '<c-^>', { silent = true })

-- quick safe file
vim.keymap.set('n', ',,', ':w <CR>')

-- delete without registering word
vim.keymap.set({ 'n', 'v' }, 'X', '"_d', { noremap = true })
-- paste without registering word
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"_dP', { noremap = true })

-- moving blocks with automatically indenting
vim.keymap.set({ 'v' }, 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set({ 'v' }, 'K', ":m '<-2<CR>gv=gv")

-- mini.files
vim.keymap.set('n', '<leader>mf', ':lua MiniFiles.open()<CR>', { noremap = true })
