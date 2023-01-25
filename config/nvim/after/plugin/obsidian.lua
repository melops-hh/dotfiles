local ok,obsidian = pcall(require, "obsidian")
if not ok then
	vim.notify("Could not find obsidian");
	return
end

obsidian.setup({
  dir = os.getenv("OBSIDIAN_PATH"),
  daily_notes = {
    folder = "daily",
    -- prefix = "daily/",
    format = "%Y-%m-%d",
  },
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  }
})

-- create a new daily note
vim.keymap.set("n", "<leader>nt",
  function()
      return "<cmd>ObsidianToday<CR>"
  end,
  {noremap = true, expr = true}
)

-- create a new note
vim.keymap.set("n", "<leader>nn",
  function()
      return "<cmd>ObsidianNew<CR>"
  end,
  {noremap = true, expr = true}
)

-- quickly switch to another notes in your vault
vim.keymap.set("n", "<leader>nf",
  function()
      return "<cmd>ObsidianQuickSwitch<CR>"
  end,
  {noremap = true, expr = true}
)

-- create a new note and link it to an in-line visual selection of text
vim.keymap.set("n", "<leader>nl",
  function()
      return "<cmd>ObsidianLinkNew<CR>"
  end,
  {noremap = true, expr = true}
)

-- follow a note reference under the cursor
vim.keymap.set("n", "gf",
  function()
      return "<cmd>ObsidianFollowLink<CR>"
  end,
  { noremap = false, expr = true}
)


