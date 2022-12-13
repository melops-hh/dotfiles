local ok = pcall(require, "onedark")
if not ok then
	vim.notify("Could not find onedark");
	return
end

-- Set colorscheme
vim.cmd [[colorscheme onedark]]
