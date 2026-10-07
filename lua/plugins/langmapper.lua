-- Дублирует привязки (<leader>ff, ; и т.д.) для кириллицы,
-- раскладки описаны в configs/keyboard-layout.lua
return {
  "Wansmer/langmapper.nvim",
  lazy = false,
  priority = 10000, -- раньше остальных, чтобы перехватить их привязки
  config = function()
    local kb = require "configs.keyboard-layout"
    -- у ru и ua буква "и" на разных клавишах, поэтому берём только текущую;
    -- после смены пары скриптом SUPER+ALT+SPACE нужно перезапустить nvim
    local lang = kb.current()

    require("langmapper").setup {
      -- jk/jj в Insert не переводим: "ол"/"оо" часто встречаются в словах
      disable_hack_modes = { "i" },
      default_layout = kb.default_layout,
      use_layouts = { lang },
      layouts = {
        [lang] = { id = lang, layout = kb.layouts[lang] },
      },
    }
  end,
}
