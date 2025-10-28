-- map kj to ESC
-- vim.keymap.set("i", "kj", "<ESC>", { silent = true })

-- quick safe file
vim.keymap.set("n", ",,", ":w <CR>")

-- delete without registering word
vim.keymap.set({ "n", "v" }, "X", '"_d', { noremap = true })

-- paste without registering word
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { noremap = true })

-- move indentation
vim.keymap.set("v", "<", "<gv", { remap = false, desc = "Move indentation to left" })
vim.keymap.set("v", ">", ">gv", { remap = false, desc = "Move indentation to right" })

-- source current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- fix TmuxNavigation
vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", {})

-- switch between current and last buffer
vim.keymap.set("n", "<leader>.", "<c-^>", { silent = true })

vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.git_files()
end)
