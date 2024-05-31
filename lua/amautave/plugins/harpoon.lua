return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      local harpoonMap = function(key, func, desc)
        vim.keymap.set('n', key, func, { desc = desc, silent = true })
      end

      local harpoonSelectMap = function(key, index)
        harpoonMap(key, function()
          harpoon:list():select(index)
        end, 'Select ' .. index)
      end

      harpoonMap('<M-h>h', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, 'Toggle [H]arpoon')

      harpoonMap('<M-h>a', function()
        harpoon:list():add()
      end, '[A]dd Harpoon')

      harpoonSelectMap('<M-h>0', 0)
      harpoonSelectMap('<M-h>1', 1)
      harpoonSelectMap('<M-h>2', 2)
      harpoonSelectMap('<M-h>3', 3)
      harpoonSelectMap('<M-h>4', 4)
      harpoonSelectMap('<M-h>5', 5)
      harpoonSelectMap('<M-h>6', 6)
      harpoonSelectMap('<M-h>7', 7)
      harpoonSelectMap('<M-h>8', 8)
      harpoonSelectMap('<M-h>9', 9)

      -- Toggle previous & next buffers stored within Harpoon list
      harpoonMap('<C-M-p>', function()
        harpoon:list():prev()
      end, '[P]revious Harpoon')
      harpoonMap('<C-M-n>', function()
        harpoon:list():next()
      end, '[N]ext Harpoon')

      harpoon:extend {
        UI_CREATE = function(cx)
          vim.keymap.set('n', '<C-v>', function()
            harpoon.ui:select_menu_item { vsplit = true }
          end, { buffer = cx.bufnr })

          vim.keymap.set('n', '<C-s>', function()
            harpoon.ui:select_menu_item { split = true }
          end, { buffer = cx.bufnr })

          vim.keymap.set('n', '<C-t>', function()
            harpoon.ui:select_menu_item { tabedit = true }
          end, { buffer = cx.bufnr })
        end,
      }
    end,
  },
  {
    'letieu/harpoon-lualine',
    event = 'VeryLazy',
    dependencies = {
      {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
      },
    },
  },
}
