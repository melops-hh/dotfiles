local colorizer_ok, colorizer = pcall(require, "colorizer")

if not colorizer_ok then
	vim.notify("Unable to load colorizer config")
	return
end

colorizer.setup()
