local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
local api = require('nvim-tree.api')


if not nvim_tree_ok then
	vim.notify("Unable to load nvim-tree config")
	return
end

nvim_tree.setup({
 sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<C-b>", function()
	local cwd = vim.fn.expand("%:p:h")
	api.tree.toggle(false, true, cwd)
	-- nvim_tree.api.tree.toggle(false, true, cwd)
end)
