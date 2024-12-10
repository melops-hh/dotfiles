vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

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

-- moving blocks with automatically indenting
vim.keymap.set({ 'v' }, 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set({ 'v' }, 'K', ":m '<-2<CR>gv=gv")

-- Search and replace on the current word under the cursor
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
