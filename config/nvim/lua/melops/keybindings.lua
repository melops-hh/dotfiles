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

map({"n", "v"}, "<leader>k", ":m .-2<CR>==")
map({"n", "v"}, "<leader>j", ":m .+1<CR>==")

-- See `:help telescope.builtin`
map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
map("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
map("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false
    })
end, { desc = "[/] Fuzzily search in current buffer]" })

map("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<c-p>", require("telescope.builtin").git_files, { desc = "[S]earch [G]it [F]iles" })

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
map("n", "<leader>gi", ":FloatermNew --width=0.95 --height=0.95 lazygit<CR>", { noremap = true })

-- quickfix list
map("n", "<C-[>", ":cprev<CR>", { noremap = true })
map("n", "<C-]>", ":cnext<CR>", { noremap = true })
