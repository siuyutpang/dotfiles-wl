return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        view = {
          width = 35,
        },
        filters = {
          custom = { '^.git$' },
        },
        actions = {
          open_file = { quit_on_open = true },
        },
        git = {
          enable = false,
        },
      })

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  }
}
