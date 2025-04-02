return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = "gemini-2.5-pro-exp-03-25",
    -- provider = "openrouter",
    vendors = {
      ["gemini-2.5-pro-exp-03-25"] = {
        __inherited_from = "gemini",
        model = "gemini-2.5-pro-exp-03-25",
        max_tokens = 800000,
      },
      ["deepseek-v3-0324"] = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_AVANTE_KEY",
        endpoint = "https://openrouter.ai/api/v1",
        model = "deepseek/deepseek-chat-v3-0324:free",
        disable_tools = true,
      },
      ["deepseek-r1"] = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_AVANTE_KEY",
        endpoint = "https://openrouter.ai/api/v1",
        model = "deepseek/deepseek-r1:free",
        disable_tools = true,
        temperature = 0,
        max_tokens = 163840,
      },
      ["qwq-32b"] = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_AVANTE_KEY",
        endpoint = "https://openrouter.ai/api/v1",
        model = "qwen/qwq-32b:free",
        temperature = 0,
        disable_tools = true,
      },
      ["gemini-2.5-pro"] = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_AVANTE_KEY",
        endpoint = "https://openrouter.ai/api/v1",
        model = "google/gemini-2.5-pro-exp-03-25:free",
        temperature = 0,
        timeout = 60000,
        disable_tools = true,
        max_tokens = 800000,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
