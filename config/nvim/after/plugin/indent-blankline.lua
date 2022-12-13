local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
    vim.notify("Could not find indent_blankline");
    return
end
-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
indent_blankline.setup {
    char = "┊",
    show_trailing_blankline_indent = false
}
