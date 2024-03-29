local trouble_ok, trouble = pcall(require, "trouble")
if not trouble_ok then
	vim.notify("Unable to load trouble config")
	return
end

trouble.setup({})

vim.keymap.set("n", "<leader>tp", function()
	vim.cmd("Trouble document_diagnostics")
end)
vim.keymap.set("n", "<leader>tP", function()
	vim.cmd("Trouble workspace_diagnostics")
end)
