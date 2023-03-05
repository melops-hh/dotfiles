local ok_mark = pcall(require, "harpoon.mark")
if not ok_mark then
	vim.notify("Could not find harpoon.mark");
	return
end
local ok_ui = pcall(require, "harpoon.ui")
if not ok_ui then
	vim.notify("Could not find harpoon.ui");
	return
end

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>fm', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>fa', mark.add_file)

vim.keymap.set('n', '<leader>1', function() ui.nav_file(1)end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2)end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3)end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4)end)
