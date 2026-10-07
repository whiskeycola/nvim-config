return {
  "nvim-treesitter/nvim-treesitter",
  -- NvChad v2.5 targets the `main` rewrite; `master` is archived and breaks on Neovim 0.12
  branch = "main",
  init = function()
    -- `main` dropped the `indent = { enable = true }` module, so opt in per buffer
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and #vim.treesitter.query.get_files(lang, "indents") > 0 then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
  opts = {
    -- installed by NvChad's :TSInstallAll (also run on plugin build)
    ensure_installed = {
      "htmldjango",
      -- "glimmer",
      "vim",
      "vimdoc",
      "lua",
      "luadoc",
      "printf",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "c",
      "markdown",
      "markdown_inline",
      "rust",
      "bash",
      "git_config",
      "gitignore",
      "go",
      "json",
      "proto",
      "python",
      "regex",
      "scss",
      "sql",
      "toml",
      "twig",
      "yaml",
      "xml",
      "svelte",
    },
  },
}
