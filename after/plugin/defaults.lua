vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = '[T]ree [T]oggle' })
vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeFocus<cr>', { desc = '[T]ree [F]ocus' })
vim.keymap.set('n', '<leader>tr', '<cmd>NvimTreeRefresh<cr>', { desc = '[T]ree [R]efresh' })
-- vim.keymap.set('n', '<leader>tff', '<cmd>NvimTreeFindFile<cr>', { desc = '[T]ree [F]ind [F]ile' })
