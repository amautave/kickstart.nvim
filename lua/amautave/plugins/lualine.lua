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
      lualine_c = {},
      lualine_x = { "diagnostics", "diff" },
      lualine_y = { "fileformat", "encoding", "filetype", "searchcount" },
      lualine_z = { "selectioncount", "progress", "location" },
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      --[[    lualine_c = { "filename" }, ]]
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
    tabline = {
      lualine_a = { 'buffers' },
      lualine_b = { { "filename", file_status = true, path = 1 } },
      lualine_c = {
        -- {
        --   function() return require("nvim-navic").get_location() end,
        --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
        -- }
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' }
    },
  },
}

-- https://github.com/adalessa/dotfiles/blob/main/nvim/.config/nvim/lua/alpha/status_line.lua
-- https://github.com/nvim-lualine/lualine.nvim
