-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  -- event = "VeryLazy",
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      -- list of servers for mason to install
      ensure_installed = {
        'tsserver',
        'html',
        'cssls',
        'tailwindcss',
        'svelte',
        'lua_ls',
        'graphql',
        'emmet_ls',
        'prismals',
        'pyright',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'pylint',
        'eslint_d',
      },
    }

    local navic = require 'nvim-navic'
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local client_id = ev.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = ev.buf

        navic.attach(client, bufnr)

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions

        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, silent = true })
        end

        -- set keybinds
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
        -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>fs', require('telescope.builtin').lsp_document_symbols, '[F]ind [S]ymbols')
        nmap('<leader>wy', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace S[y]mbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        nmap('<leader>fd', require('telescope.builtin').diagnostics, '[F]ind [D]iagnostics')
        nmap('<leader>fD', '<cmd>Telescope diagnostics bufnr=0<CR>', '[F]ind [D]iagnostics for file')
        nmap('<leader>do', vim.diagnostic.open_float, '[D]iagnostic [O]pen float/line')
        nmap('<leader>dl', vim.diagnostic.setloclist, '[D]iagnostic [L]ist')
        nmap('[d', vim.diagnostic.goto_prev, 'Goto previous dianostic message')
        nmap(']d', vim.diagnostic.goto_prev, 'Goto next dianostic message')
        nmap('<leader>lr', ':LspRestart<CR>', '[L]SP [R]estart')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end,
    })

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    local function tsserver_organize_imports()
      local params = {
        command = '_typescript.organizeImports',
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = '',
      }
      vim.lsp.buf.execute_command(params)
    end

    local lspconfig = require 'lspconfig'

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ['svelte'] = function()
        -- configure svelte server
        lspconfig['svelte'].setup {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd('BufWritePost', {
              pattern = { '*.js', '*.ts' },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
              end,
            })
          end,
        }
      end,
      ['graphql'] = function()
        -- configure graphql language server
        lspconfig['graphql'].setup {
          capabilities = capabilities,
          filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
        }
      end,
      ['emmet_ls'] = function()
        -- configure emmet language server
        lspconfig['emmet_ls'].setup {
          capabilities = capabilities,
          filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
        }
      end,
      ['lua_ls'] = function()
        -- configure lua server (with special settings)
        lspconfig['lua_ls'].setup {
          capabilities = capabilities,
          -- cmd = { 'lua-language-server.cmd'},
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { 'vim' },
              },
              completion = {
                callSnippet = 'Replace',
              },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        }
      end,
      ['tsserver'] = function()
        lspconfig['tsserver'].setup {
          capabilities = capabilities,
          commands = {
            OrganizeImports = {
              tsserver_organize_imports,
              description = 'Organize Imports',
            },
          },
        }
      end,
    }
  end,
}
