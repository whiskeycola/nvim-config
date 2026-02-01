local nvlsp = require "nvchad.configs.lspconfig"

return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  ft = {
    "typsescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "html",
  },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    root_dir = require("lspconfig").util.root_pattern("bun.lock", "package.json", ".git"),
  },
}
