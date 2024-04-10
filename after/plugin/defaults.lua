vim.keymap.set('n', '<leader>x', ':bd<cr>', { desc = '[X] Close Buffer' })

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>et', '<cmd>Neotree toggle<cr>', { desc = '[E]xplorer [T]oggle' })
vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<cr>', { desc = 'Toggle [N]eotree' })
vim.keymap.set('n', '<leader>ef', '<cmd>Neotree focus<cr>', { desc = '[E]xplorer [F]ocus' })
vim.keymap.set('n', '<leader>eg', '<cmd>Neotree float git_status<cr>', { desc = '[E]xplorer [G]it Status' })
vim.keymap.set('n', '<leader>eb', '<cmd>Neotree buffers<cr>', { desc = '[E]xplorer [B]uffers' })

vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = '[T]oggleTerm [F]loat' })
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm size=15 direction=horizontal<cr>',
	{ desc = '[T]oggleTerm [H]orizontal split' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>',
	{ desc = '[T]oggleTerm [V]ertical split' })

-- maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
-- maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
-- maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
-- maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})


vim.keymap.set('n', '<leader>ff', '<Cmd>LspFormatToggle<cr>', { desc = '[F]eature [F]ormat Toggle' })
