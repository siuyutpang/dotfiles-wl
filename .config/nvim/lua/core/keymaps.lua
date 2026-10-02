vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jj", "<Esc>", opts)
keymap.set("v", "$", "g_", opts)
keymap.set("v", "Y", '"+y')
keymap.set("n", "Y", "y$", opts)
-- keymap.set("i", "<C-v>", '<Esc>"+pa', opts)
keymap.set('i', '<C-v>', '<C-r>0', opts)
keymap.set("v", "p", '"_dP', opts)
keymap.set("n", "<C-z>", '<Nop>', opts)
keymap.set('n', ',,', '/<++><CR>:noh<CR>ca<', opts)
keymap.set('i', ',,', '<Esc>/<++><CR>:noh<CR>ca<', opts)
keymap.set("n", "<leader>a", "<cmd>silent %y+<CR>", opts)
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- 不用模式下的单行或多行移动
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

keymap.set("n", "<leader>nh", ":nohl<CR>", opts)  -- 取消高亮

keymap.set("n", "<leader>sv", "<C-w>v", opts)  -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s", opts)  -- 垂直新增窗口

-- Move to previous/next
keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Close buffer
keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Goto buffer in position...
keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
