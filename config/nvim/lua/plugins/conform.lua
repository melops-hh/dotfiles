return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- filetypes you want formatted by Prettier
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      vue = { "prettierd", "prettier" },
      svelte = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      jsonc = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      graphql = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      less = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      ["markdown.mdx"] = { "prettierd", "prettier" },
    })

    -- Only run Prettier if a config exists in the project (avoids formatting random files)
    opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
      prettierd = {
        condition = function(ctx)
          return vim.fs.find({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yaml",
            ".prettierrc.yml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
            "prettier.config.ts",
            "package.json",
          }, { path = ctx.dirname, upward = true })[1] ~= nil
        end,
      },
    })

    return opts
  end,
}
