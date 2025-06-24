local M = require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "jj", "<ESC>")

map("n", "<leader>oe", function()
  vim.system { "nautilus", "." }
end, { desc = "open nautilus current project" })

map("n", "<leader>ov", function()
  vim.system({ "code", "." }, { detach = true })
  print "Starting VS Code..."
end, { desc = "open project in visual studio code" })

map("n", "<leader>oc", function()
  vim.system({ "cursor", "." }, { detach = true })
  print "Starting Cursor..."
end, { desc = "open project in cursor" })
map(
  "n",
  "<leader>ot",
  "<cmd> exe 'silent !kitty --detach --directory ' . getcwd() <CR>",
  { desc = "open terminal new window" }
)
