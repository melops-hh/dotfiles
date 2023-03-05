-- Keymaps for better default experience
local map = vim.keymap.set

map({"n", "v"}, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- map kj to ESC
map("i", "kj", "<ESC>", { silent = true })

-- switch between current and last buffer
map("n", "<leader>.", "<c-^>", { silent = true })

-- quick safe file
map("n", ",,", ":w <CR>")

-- delete without registering word
map({"n", "v"}, "X", '"_d', { noremap = true })
-- paste without registering word
map({"n", "v"}, "<leader>p", '"_dP', { noremap = true })

-- moving blocks with automatically indenting
map({"v"}, "J", ":m '>+1<CR>gv=gv")
map({"v"}, "K", ":m '<-2<CR>gv=gv")

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "<leader>q", vim.diagnostic.setloclist)

-- open netrw file explorer in a verticall split
-- map("n", "<c-b>", ":Lexplore<CR>")

-- undo break points
map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })

-- navigate search while staying centered
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })

-- open file according to mimetype
map("n", "<leader>o", "<cmd>!open %<cr><cr>", { noremap = true })

-- center while scrolling and searching
map("n", "<c-u>", "<c-u>zz", { noremap = true })
map("n", "<c-d>", "<c-d>zz", { noremap = true })
map("n", "n", "nzz", { noremap = true })

-- open lazygit in a floating window
map("n", "<leader>lz", ":FloatermNew --width=0.95 --height=0.95 lazygit<CR>", { noremap = true })

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- quickfix list
map("n", "<C-[>", ":cprev<CR>", { noremap = true })
map("n", "<C-]>", ":cnext<CR>", { noremap = true })
