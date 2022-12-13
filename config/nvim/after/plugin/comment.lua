local ok, Comment = pcall(require, "Comment")
if not ok then
    vim.notify("Could not find Comment");
    return
end
-- Enable Comment.nvim
Comment.setup({
    toggler = {
        line = "cl"
    },
    opleader = {
        line = "<leader>c"
    }
})
