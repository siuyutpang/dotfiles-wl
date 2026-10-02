return {
  {
    'ajmwagar/vim-deus',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme deus")    -- another flavor: vim.cmd.colorscheme "deus"
      vim.cmd('highlight CursorLine gui=none guibg=NONE')
      vim.cmd('highlight clear CursorLine')
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  'mhinz/vim-startify',
  'mg979/vim-visual-multi',
  'tpope/vim-surround',
  'tpope/vim-commentary',
}
