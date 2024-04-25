return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }

        vim.keymap.set('n', '<leader>et', '<cmd>Neotree toggle<cr>', { desc = '[E]xplorer [T]oggle' })
        vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<cr>', { desc = 'Toggle [N]eotree' })
        vim.keymap.set('n', '<leader>ef', '<cmd>Neotree focus<cr>', { desc = '[E]xplorer [F]ocus' })
        vim.keymap.set('n', '<leader>eg', '<cmd>Neotree float git_status<cr>', { desc = '[E]xplorer [G]it Status' })
        vim.keymap.set('n', '<leader>eb', '<cmd>Neotree buffers<cr>', { desc = '[E]xplorer [B]uffers' })
      end,
    },
  },
}
