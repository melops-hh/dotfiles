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
  },
  options = {
    number = true,
    relativenumber = true,
  }
})

vim.keymap.set("n", "<leader>zz", function()
	zenmode.toggle()
	vim.wo.wrap = false
end)
