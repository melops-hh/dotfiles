return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        -- Remove <CR> mapping so Enter just works like normal
        ["<CR>"] = { "fallback" },
      },
      completion = {
        enabled = false, -- disables automatic completion
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
