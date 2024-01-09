return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        mode = "buffers",
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        enforce_regular_tabs = true,
        show_tab_indicators = true,
        -- Consider use of edgy.nvim
        -- offsets = {
        --   {
        --     filetye = "neo-tree",
        --     text = "NeoTree Explorer",
        --     text_align = "left",
        --     separator = true
        --   }
        -- }
      },
      -- highlights = {
      --   separator = {
      --     guifg = '#073642',
      --     guibg = '#002b36',
      --   },
      --   separator_selected = {
      --     guifg = '#073642',
      --   },
      --   background = {
      --     guifg = '#657b83',
      --     guibg = '#002b36'
      --   },
      --   buffer_selected = {
      --     guifg = '#fdf6e3',
      --     gui = "bold",
      --   },
      --   fill = {
      --     guibg = '#073642'
      --   }
      -- },
    }
  end,
}
