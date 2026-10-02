local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

opt.scrolloff = 5
opt.sidescrolloff = 5

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- search setting
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- enable mouse
opt.mouse:append('a')

-- enable system clipboard
opt.clipboard:append('unnamedplus')

opt.backspace = "indent,eol,start"

opt.iskeyword:append("-")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
opt.signcolumn = "no"
opt.cursorline = true
opt.background = "dark"
opt.showmode = false        -- another flavor: vim.cmd("set noshowmode")

opt.wrap = false            -- 禁止折叠代码
opt.swapfile = false
opt.encoding = 'utf-8'

opt.list = false
opt.listchars = 'tab:»·,nbsp:+,trail:.,extends:→,precedes:←'

-- highlight yanked line
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

-- individual indentation for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua,markdown",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end,
})

-- restore last cursor position when open file
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line
    if line("'\"") > 1 and line("'\"") <= line("$") then
      vim.cmd("normal! g'\"")
    end
  end
})
