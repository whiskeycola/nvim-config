return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev stuff
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "eslint-lsp",
      "prettierd",
      "prettier",
      "tailwindcss-language-server",
      "djlint",
      "prettier",

      -- c/cpp stuff
      "clangd",
      "clang-format",

      -- rust
      "rust-analyzer",
      -- go
      "gopls",
    },
  },
}
