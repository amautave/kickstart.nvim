vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>et', '<cmd>Neotree toggle<cr>', { desc = '[E]xplorere [T]oggle' })
vim.keymap.set('n', '<leader>ef', '<cmd>Neotree focus<cr>', { desc = '[E]xplorer [F]ocus' })
vim.keymap.set('n', '<leader>eg', '<cmd>Neotree float git_status<cr>', { desc = '[E]xplorer [G]it Status' })
vim.keymap.set('n', '<leader>eb', '<cmd>Neotree buffers<cr>', { desc = '[E]xplorer [B]uffers' })
