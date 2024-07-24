return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      globalstatus = true,
      theme = 'catppuccin',
      component_separators = { left = ' ', right = ' ' },
      section_separators = '',
    },
    extensions = { 'fugitive', 'neo-tree', 'trouble' },
    sections = {
      lualine_a = { { 'mode', upper = true } },
      lualine_b = { { 'branch', icon = '' } },
      lualine_c = {
        '%=', -- make the indicator center
        'harpoon2',
      },
      lualine_x = {
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        },
        'diagnostics',
        'diff',
      },
      lualine_y = { 'fileformat', 'encoding', 'filetype', 'searchcount' },
      lualine_z = { 'selectioncount', 'progress', 'location' },
    },
    winbar = {
      lualine_a = {},
      lualine_b = {
        {
          'filename',
          path = 1,
        },
      },
      -- lualine_c = {},
      lualine_c = {
        {
          function()
            return require('nvim-navic').get_location()
          end,
          cond = function()
            return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
          end,
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {
      lualine_a = { 'buffers' },
      lualine_b = {},
      lualine_c = {
        -- {
        --   function() return require("nvim-navic").get_location() end,
        --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
        -- }
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' },
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts)

    vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = '[B]uffer [N]ext', silent = true })
    vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = '[B]uffer [P]reviouw', silent = true })
    -- vim.keymap.set('n', '<leader>bj', '<cmd>LualineBuffersJump<SPACE>', { desc = '[B]uffer [J]ump', silent = true })
  end,
}

-- https://github.com/adalessa/dotfiles/blob/main/nvim/.config/nvim/lua/alpha/status_line.lua
-- https://github.com/nvim-lualine/lualine.nvim
