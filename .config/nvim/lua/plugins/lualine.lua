return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  opts = {
    options = {
      theme = 'dracula',
      icons_enabled = false,
      component_separators = { left = '', right = '|' },
      section_separators = { left = '', right = '' },
    }
  }
}
