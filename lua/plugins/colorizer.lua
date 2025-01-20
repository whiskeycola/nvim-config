local plugin =   {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  }

return plugin
