return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    animation = false,

    auto_hide = true,

    clickable = true,

    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 30,
    minimum_length = 0,

    sidebar_filetypes = {
      NvimTree = true,
      undotree = {text = 'undotree'},
      ['neo-tree'] = {event = 'BufWipeout'},
      Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
    },

    no_name_title = nil,
  },
  version = '^1.0.0',
}
