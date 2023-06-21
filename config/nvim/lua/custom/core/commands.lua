-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Format on save with Neoformat
vim.api.nvim_create_autocmd(
  { "BufWritePre" },
  {
    pattern = { "*.js", "*.ts", "*.mjs", "*.tsx", "*.dart", "*.lua", "*.go" },
    command = [[Neoformat]]
  }
)
