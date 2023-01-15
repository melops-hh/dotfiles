require("obsidian").setup({
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
