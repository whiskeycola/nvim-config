return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false,
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>k", function()
      vim.cmd.RustLsp { "hover", "actions" }
    end, { desc = "rust hover actions" })
    -- map("n", "<leader>a", function()
    --   vim.cmd.RustLsp "codeAction"
    -- end, { desc = "rust code actions" })
  end,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          if vim.lsp.inlay_hint then
            -- require("lsp-endhints").disable()
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          local on_attach = require("nvchad.configs.lspconfig").on_attach
          on_attach(client, bufnr)
        end,
      },
    }
  end,
}
