local ok, zenmode = pcall(require, "zen-mode")
if not ok then
    vim.notify("Could not find zen-mode");
    return
end

zenmode.setup({
  window = {
    width = .80 -- width will be 85% of the editor width
  },
  plugins = {
    tmux = { enabled = false }
  }
})

vim.keymap.set("n", "<leader>zz", function()
	zenmode.toggle()
	vim.wo.wrap = false
	vim.wo.number = true
	vim.wo.relativenumber = true
end)
