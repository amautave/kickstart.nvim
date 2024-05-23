-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    'SmiteshP/nvim-navic',
    dependencies = { 'neovim/nvim-lspconfig' },
  },

  -- Enhace popups
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'github/copilot.vim',
  },
}
