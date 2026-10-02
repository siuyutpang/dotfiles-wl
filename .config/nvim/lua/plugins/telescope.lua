return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap

    keymap.set('n', '<leader>ff', builtin.find_files, {})
    keymap.set('n', '<leader>fg', builtin.live_grep, {})
    keymap.set('n', '<leader>fb', builtin.buffers, {})
    keymap.set('n', '<leader>fh', builtin.help_tags, {})

    local actions = require 'telescope.actions'
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['esc'] = actions.close,
          },
        },
        dynamic_preview_title = true,
        path_display = { 'smart' },
      },
      layout_config = {
        horizontal = {
          preview_cutoff = 100,
          preview_width = 0.5,
        },
      },
    }
  end,
}
