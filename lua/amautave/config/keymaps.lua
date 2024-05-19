-- [[ Basic Keymaps ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- window navigation
vim.keymap.set('n', '<c-h>', '<C-w>h', { desc = 'Go to the left window' })
vim.keymap.set('n', '<c-j>', '<C-w>j', { desc = 'Go to the down window' })
vim.keymap.set('n', '<c-k>', '<C-w>k', { desc = 'Go to the up window' })
vim.keymap.set('n', '<c-l>', '<C-w>l', { desc = 'Go to the right window' })

vim.keymap.set('n', '<c-x>', ':bd<cr>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bo', ':BufOnly<cr>', { desc = '[B]uffer [O]nly', silent = true })
vim.keymap.set('n', '<M-x>', ':close<cr>', { desc = '[X] Close Window' })

-- -- window management
-- vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab [O]pen new tab' }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab [X] Close current tab' }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = '[T]ab Go to [N]ext tab' }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = '[T]ab Go to [P]revious tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>tc', '<cmd>tabnew %<CR>', { desc = '[T]ab Open [C]urrent buffer in new tab' }) --  move current buffer to new tab
