return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      globalstatus = true,
      theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
    extensions = { "quickfix", "fugitive", "neo-tree", "toggleterm", "trouble" },
    sections = {
      lualine_a = { { "mode", upper = true } },
      lualine_b = { { "branch", icon = "" } },
      lualine_c = { { "filename", file_status = true, path = 1 } },
      lualine_x = { "diagnostics", "diff" },
      lualine_y = { "filetype" },
      lualine_z = { "selectioncount", "progress", "location" },
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}

-- https://github.com/adalessa/dotfiles/blob/main/nvim/.config/nvim/lua/alpha/status_line.lua
-- https://github.com/nvim-lualine/lualine.nvim
