return {
  {
    dir = "/Users/spiegel/Repos/melops/standup.nvim",
    name = "standup.nvim",
    config = function()
      require("standup").setup({
        -- optional overrides
        -- idle_timeout = 120,
        -- tick_interval = 1,
        -- flush_interval = 60,
      })
    end,
  },
}
