-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
  },
  build = ':TSUpdate',
  config = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      -- ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },
      ensure_installed = {
        'lua',
        'python',
        'tsx',
        'json',
        'javascript',
        'typescript',
        'vimdoc',
        'vim',
        'bash',
        'yaml',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'svelte',
        'graphql',
        'dockerfile',
        'gitignore',
        'prisma',
      },
      sync_install = false,

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = false,
      ignore_install = {},

      highlight = { enable = true },
      indent = { enable = true },
      -- TODO Make sure autotag works
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { 'html', 'xml', 'tsx', 'jsx' },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          scope_incremental = '<Tab>',
          node_decremental = '<s-Tab>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}
