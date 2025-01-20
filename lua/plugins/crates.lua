return {
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>rcu", function()
      require("crates").update_all_crates()
    end, { desc = "Update all crates" })
  end,
  config = function(_, opts)
    local crates = require "crates"
    crates.setup(opts)
    crates.show()
  end,
}
