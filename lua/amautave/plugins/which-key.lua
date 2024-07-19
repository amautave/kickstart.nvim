return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  -- init = function()
  --   vim.o.timeout = true
  --   vim.o.timeoutlen = 500
  -- end,
  dependencies = {
    { 'echasnovski/mini.nvim', version = false },
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    preset = 'modern',
  },
  keys = {
    { '<M-h>', group = '[H]arpoon' },
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]iagnostics' },
    { '<leader>f', group = '[F]ind' },
    { '<leader>g', group = '[G]it' },
    { '<leader>h', group = '[H]unks (More Git)' },
    { '<leader>s', group = '[S]with / [S]ession' },
    { '<leader>t', group = '[T]ab / [T]oggle / [T]oggleTerm' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>x', group = '[X] Trouble' },
  },
}
