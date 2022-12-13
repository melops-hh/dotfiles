local ok, lualine = pcall(require, "lualine")
if not ok then
    vim.notify("Could not find lualine");
    return
end
-- Set lualine as statusline
-- See `:help lualine.txt`
lualine.setup {
    options = {
        icons_enabled = true,
        theme = "onedark"
        -- component_separators = "|",
        -- section_separators = "",
    },
    sections = {
        lualine_a = {{
            "filename",
            path = 1
        }}
    }
}
