return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    -- document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]iagnostics', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = '[H]unks (More Git)', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]with / [S]ession', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = '[X] Trouble', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]ab / [T]oggle / [T]oggleTerm', _ = 'which_key_ignore' },
      ['<M-h>'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
    }
  end,
}
