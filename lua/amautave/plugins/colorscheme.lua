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
    require("catppuccin").setup({
      flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      -- flavour = "auto" -- will respect terminal's background
      background = {         -- :h background
        light = "latte",
        dark = "mocha",
      },
    })
    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
  end,
}
