return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- uncomment for format on save
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      ["jinja.html"] = { "prettierd" },
    },

    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
    format_after_save = {
      lsp_format = "fallback",
    },
  },
}
