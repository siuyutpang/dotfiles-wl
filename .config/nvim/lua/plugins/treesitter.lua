-- nvim-treesitter main 分支(适配 Neovim 0.12,需要 tree-sitter CLI >= 0.26)
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false, -- main 分支不支持懒加载
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install {
        'awk', 'bash', 'c', 'cpp', 'css', 'diff',
        'git_config', 'gitignore', 'go', 'html', 'hyprlang', 'ini',
        'java', 'javascript', 'json', 'kdl', 'lua',
        -- jsonc: main 分支暂不支持,继续使用旧 parser(不随 :TSUpdate 更新)
        'markdown', 'markdown_inline', 'nix', 'python', 'ssh_config',
        'toml', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml',
      }

      -- main 分支不再自动开启高亮,需要手动 start
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = false,

          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },

          include_surrounding_whitespace = false,
        },
      }

      local select = require('nvim-treesitter-textobjects.select')
      local map_select = function(lhs, query, group, desc)
        vim.keymap.set({ 'x', 'o' }, lhs, function()
          select.select_textobject(query, group)
        end, { desc = desc })
      end

      map_select('af', '@function.outer', 'textobjects', 'Select outer function')
      map_select('if', '@function.inner', 'textobjects', 'Select inner function')
      map_select('ac', '@class.outer', 'textobjects', 'Select outer class')
      map_select('ic', '@class.inner', 'textobjects', 'Select inner class')
      map_select('as', '@local.scope', 'locals', 'Select language scope')
    end,
  },
}
