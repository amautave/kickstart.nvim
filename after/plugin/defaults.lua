vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>te', '<cmd>NvimTreeToggle<cr>', { desc = '[T]ree [E]xplorer' })
--vim.keymap.set('n', '<leader>te', require('nvim-tree.actions.tree').NvimTreeToggle, { desc = '[T]ree [E]xplorer' })
