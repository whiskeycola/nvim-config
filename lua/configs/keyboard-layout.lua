-- Работа с русской/украинской раскладкой (машинопись) без постоянного переключения
local M = {}

-- Английские клавиши и кириллица на тех же местах (символ к символу)
M.default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}?abcdefghijklmnopqrstuvwxyz,.;'[]/]]
M.layouts = {
  -- ru(typewriter): ъ на ], ё на /
  ru = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪЁфисвуапршолдьтщзйкыегмцчнябюжэхъё",
  -- ua(typewriter): ґ на ], и на s, є на ', і на b, ї на /
  ua = "ФІСВУАПРШОЛДЬТЩЗЙКИЕГМЦЧНЯБЮЖЄХҐЇфісвуапршолдьтщзйкиегмцчнябюжєхґї",
}

local is_hyprland = vim.env.HYPRLAND_INSTANCE_SIGNATURE ~= nil and vim.fn.executable "hyprctl" == 1

-- Какая кириллица сейчас настроена в Hyprland: "ru" или "ua"
-- (пару us,ru <-> us,ua меняет скрипт toggle_lang.sh)
function M.current()
  if not is_hyprland then
    return "ru"
  end
  local ok, data = pcall(vim.json.decode, vim.fn.system { "hyprctl", "getoption", "input:kb_layout", "-j" })
  return ok and type(data) == "table" and (data.str or ""):find "ua" and "ua" or "ru"
end

-- 1. langmap: кириллица в Normal/Visual режиме работает как английские
--    буквы на тех же клавишах (о -> j, л -> k, Ж -> : и т.д.).
--    Действует только на встроенные команды, свои привязки переводит langmapper
local function langmap(lang)
  local function escape(str)
    return (str:gsub("[,;\\]", "\\%0"))
  end
  return escape(M.layouts[lang]) .. ";" .. escape(M.default_layout)
end

vim.opt.langmap = langmap(M.current())

if not is_hyprland then
  return M
end

-- 2. Hyprland: при выходе из Insert включаем английскую раскладку,
--    при входе в Insert возвращаем ту, что была
local saved_layout = 0

local function set_layout(idx)
  vim.system { "hyprctl", "switchxkblayout", "all", tostring(idx) }
end

-- узнаёт активную раскладку главной клавиатуры и заодно подстраивает langmap
-- под текущую пару (us, ru / us, ua)
local function with_current_layout(cb)
  vim.system({ "hyprctl", "devices", "-j" }, { text = true }, function(res)
    if res.code ~= 0 then
      return
    end
    vim.schedule(function()
      local ok, data = pcall(vim.json.decode, res.stdout)
      if not ok then
        return
      end
      for _, kb in ipairs(data.keyboards or {}) do
        if kb.main then
          local lm = langmap(kb.layout:find "ua" and "ua" or "ru")
          if vim.o.langmap ~= lm then
            vim.o.langmap = lm
          end
          if cb then
            cb(kb.active_layout_index)
          end
          return
        end
      end
    end)
  end)
end

local group = vim.api.nvim_create_augroup("KeyboardLayout", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    with_current_layout(function(idx)
      saved_layout = idx
      if idx ~= 0 then
        set_layout(0)
      end
    end)
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = function()
    if saved_layout ~= 0 then
      set_layout(saved_layout)
    end
  end,
})

-- вернулся в окно nvim (раскладка могла смениться в другом приложении) или
-- открыл командную строку через ":" — тоже нужна английская
vim.api.nvim_create_autocmd({ "FocusGained", "CmdlineEnter" }, {
  group = group,
  callback = function(ev)
    if ev.event == "CmdlineEnter" and vim.fn.getcmdtype() ~= ":" then
      return
    end
    if ev.event == "FocusGained" then
      with_current_layout()
    end
    if vim.fn.mode() == "i" then
      return
    end
    set_layout(0)
  end,
})

return M
