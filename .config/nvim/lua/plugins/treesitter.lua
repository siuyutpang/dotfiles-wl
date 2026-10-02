return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = {
        "c", "cpp", "go", "java", "python",
        "html", "css", "javascript", "typescript",
        "lua", "vim", "bash",
        "json", "yaml", "markdown", 'markdown_inline',
        "gitignore",
      },
      sync_install = false,

      auto_install = true,

      highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },

      textobjects = {
        select = {
          enable = true,

          lookahead = false,

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",

            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },

          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },

          include_surrounding_whitespace = false,
        },
    }
  }
  end,
}
