local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util"

-- ПРЕДУПРЕЖДЕНИЕ: Если NvChad обновлен под 2026 год, эту строку можно оставить.
-- Если она вызывает ошибку, закомментируй её, так как она использует старый lspconfig.setup.
-- require("nvchad.configs.lspconfig").defaults()

-- Определяем список простых серверов
local servers = { "cssls", "clangd", "eslint", "svelte" }

-- 1. Настройка списка серверов (бывший цикл)
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end

-- 2. Настройка TypeScript (ts_ls)
vim.lsp.config("ts_ls", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
      },
    },
  },
})
vim.lsp.enable "ts_ls"

-- 3. Настройка HTML
vim.lsp.config("html", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "handlebars", "htmldjango", "jinja", "jinja2", "jinja.html" },
})
vim.lsp.enable "html"

-- 4. Настройка Gopls
vim.lsp.config("gopls", {
  on_attach = nvlsp.on_attach,
  -- В твоем коде была ошибка: capabilities = nvlsp.on_attach. Я исправил на .capabilities
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
vim.lsp.enable "gopls"

-- 5. Настройка TailwindCSS
vim.lsp.config("tailwindcss", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  init_options = {
    userLanguages = {
      ["jinja.html"] = "html",
    },
  },
  filetypes = {
    "aspnetcorerazor",
    "astro",
    "astro-markdown",
    "blade",
    "clojure",
    "django-html",
    "htmldjango",
    "edge",
    "eelixir",
    "elixir",
    "ejs",
    "erb",
    "eruby",
    "gohtml",
    "gohtmltmpl",
    "haml",
    "handlebars",
    "hbs",
    "html",
    "html-eex",
    "heex",
    "jade",
    "jinja",
    "jinja.html",
    "leaf",
    "liquid",
    "markdown",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    "sugarss",
    "javascript",
    "javascriptreact",
    "reason",
    "rescript",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  },
})
vim.lsp.enable "tailwindcss"

-- Если закомментировал defaults() в начале, добавь настройку Lua вручную, если нужна:
vim.lsp.config("lua_ls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
vim.lsp.enable "lua_ls"
