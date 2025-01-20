local plugin = {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "roobert/tailwindcss-colorizer-cmp.nvim",
    },
    opts = function()
      local M = require "nvchad.configs.cmp"
      local format_kind = M.formatting.format
      table.insert(M.sources, { name = "crates" })
      M.formatting.format = function(entry, item)
        format_kind(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
      return M
    end,
  }
return plugin
