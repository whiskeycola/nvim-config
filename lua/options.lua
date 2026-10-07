require "nvchad.options"

-- add yours here!

local o = vim.o
-- Включаем синхронизацию с системным буфером обмена
o.clipboard = "unnamedplus" 

-- o.cursorlineopt ='both' -- to enable cursorline!

require "configs.keyboard-layout"
