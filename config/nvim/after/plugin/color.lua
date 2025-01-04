local function update_theme()
  if vim.loop.os_uname().sysname == 'Darwin' then
    -- Check if 'defaults' is executable
    if vim.fn.executable 'defaults' ~= 0 then
      -- Execute command to check if the macOS appearance is set to Dark
      local appleInterfaceStyle = vim.fn.system { 'defaults', 'read', '-g', 'AppleInterfaceStyle' }
      if appleInterfaceStyle:find 'Dark' then
        vim.cmd.colorscheme 'catppuccin-macchiato'
      else
        vim.cmd.colorscheme 'catppuccin-latte'
      end
    end
  else
    vim.cmd.colorscheme 'catppuccin-latte'
  end
end

update_theme()

-- Run every 60 seconds
vim.defer_fn(function()
  update_theme()
end, 60.000)

vim.api.nvim_create_user_command('UpdateTheme', update_theme, {})
