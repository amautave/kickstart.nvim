-- return {
--   -- Theme inspired by Atom
--   'navarasu/onedark.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'onedark'
--   end,
--   enabled = false,
-- }

return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      -- flavour = "auto" -- will respect terminal's background
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
    }
    -- setup must be called before loading
    vim.cmd.colorscheme 'catppuccin'
  end,
}

-- return {
--   'neanias/everforest-nvim',
--   version = false,
--   lazy = false,
--   priority = 1000, -- make sure to load this before all the other start plugins
--   -- Optional; default configuration will be used if setup isn't called.
--   config = function()
--     local everforest = require 'everforest'
--
--     everforest.setup {
--       background = 'medium',
--       transparent_background_level = 0,
--       italics = true,
--       disable_italic_comments = false,
--       on_highlights = function(hl, _)
--         hl['@string.special.symbol.ruby'] = { link = '@field' }
--       end,
--     }
--
--     everforest.load()
--   end,
-- }
