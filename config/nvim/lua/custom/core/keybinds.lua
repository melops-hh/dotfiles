-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- map kj to ESC
vim.keymap.set("i", "kj", "<ESC>", { silent = true })

-- switch between current and last buffer
vim.keymap.set("n", "<leader>.", "<c-^>", { silent = true })

-- quick safe file
vim.keymap.set("n", ",,", ":w <CR>")

-- delete without registering word
vim.keymap.set({ "n", "v" }, "X", '"_d', { noremap = true })
-- paste without registering word
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { noremap = true })

-- moving blocks with automatically indenting
vim.keymap.set({ "v" }, "J", ":m '>+1<CR>gv=gv")
vim.keymap.set({ "v" }, "K", ":m '<-2<CR>gv=gv")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- quickfix list
vim.keymap.set("n", "<C-[>", ":cprev<CR>", { noremap = true })
vim.keymap.set("n", "<C-]>", ":cnext<CR>", { noremap = true })

vim.keymap.set("n", "<C-b>", require("oil").open, { desc = "Open parent directory" })


-- open lazygit in a floating window
vim.keymap.set("n", "<leader>lz", ":FloatermNew --width=1.00 --height=1.00 lazygit<CR>", { noremap = true })
