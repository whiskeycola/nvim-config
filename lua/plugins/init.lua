return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "NvChad/nvterm",
    opts = { terminals = {
      shell = "/usr/bin/zsh",
    } },
  },
  {
    "whiskeycola/vim-mustache-handlebars",
    ft = { "handlebars" },
  },
  {
    "Glench/Vim-Jinja2-Syntax",
    ft = { "html" },
  },
  -- {
  --   "chrisgrieser/nvim-lsp-endhints",
  --   event = "LspAttach",
  --   opts = {}, -- required, even if empty
  -- },
}
