-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- center on next/prev
vim.keymap.set('n', 'n', 'nzzzv', { remap = false, desc = 'Next search result' })
vim.keymap.set('n', 'N', 'Nzzzv', { remap = false, desc = 'Prev search result' })

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

-- move indentation
vim.keymap.set('v', '<', '<gv', { remap = false, desc = 'Move indentation to left' })
vim.keymap.set('v', '>', '>gv', { remap = false, desc = 'Move indentation to right' })

-- Quickfixlist
vim.keymap.set('n', 'ql', '<cmd>copen<cr>', { remap = false, desc = 'Open quickfixlist' })
vim.keymap.set('n', 'qn', '<cmd>cnewer<cr>', { remap = false, desc = 'Next quickfixlist in history' })
vim.keymap.set('n', 'qp', '<cmd>colder<cr>', { remap = false, desc = 'Prev quickfixlist in history' })

-- moving blocks with automatically indenting
vim.keymap.set({ 'v' }, 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set({ 'v' }, 'K', ":m '<-2<CR>gv=gv")

-- Search and replace on the current word under the cursor
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
