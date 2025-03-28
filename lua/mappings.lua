local M = require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")
map("n", "gE", function()
  vim.system { "nautilus", "." }
end, { desc = "open nautilus current project" })

map(
  "n",
  "<leader>tt",
  "<cmd> exe 'silent !kitty --detach --directory ' . getcwd() <CR>",
  { desc = "open terminal new window" }
)
