-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  -- event = "VeryLazy",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    'hrsh7th/cmp-nvim-lsp',
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',                   opts = {} },
  },
  config = function()
    -- local navic = require("nvim-navic")
    --
    -- --  This function gets run when an LSP connects to a particular buffer.
    -- local on_attach = function(client, bufnr)
    --   navic.attach(client, bufnr)
    --   -- NOTE: Remember that lua is a real programming language, and as such it is possible
    --   -- to define small helper and utility functions so you don't have to repeat yourself
    --   -- many times.
    --   --
    --   -- In this case, we create a function that lets us more easily define mappings specific
    --   -- for LSP related items. It sets the mode, buffer and description for us each time.
    --   local nmap = function(keys, func, desc)
    --     if desc then
    --       desc = 'LSP: ' .. desc
    --     end
    --
    --     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    --   end
    --
    --   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    --   nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    --
    --   nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    --   nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    --   nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    --   nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    --   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    --   nmap('<leader>wy', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace S[y]mbols')
    --
    --   -- See `:help K` for why this keymap
    --   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    --   nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    --
    --   -- Lesser used LSP functionality
    --   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    --   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    --   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    --   nmap('<leader>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --   end, '[W]orkspace [L]ist Folders')
    --
    --   -- Create a command `:Format` local to the LSP buffer
    --   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --     vim.lsp.buf.format()
    --   end, { desc = 'Format current buffer with LSP' })
    -- end

    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    -- local lspconfig = require("lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- mason.setup();
    -- mason_lspconfig.setup()
    -- Setup neovim lua configuration
    require('neodev').setup()

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "isort",    -- python formatter
        "black",    -- python formatter
        "pylint",
        "eslint_d",
      },
    })

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    --
    --  If you want to override the default filetypes that your language server will attach to you can
    --  define the property 'filetypes' to the map in question.
    -- local servers = {
    --   -- clangd = {},
    --   -- gopls = {},
    --   -- pyright = {},
    --   -- rust_analyzer = {},
    --   tsserver = {
    --     -- npm i -g typescript-language-server <== Needed
    --     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    --     cmd = { "typescript-language-server", "--stdio" }
    --   },
    --   -- html = { filetypes = { 'html', 'twig', 'hbs'} },
    --
    --   lua_ls = {
    --     Lua = {
    --       workspace = { checkThirdParty = false },
    --       telemetry = { enable = false },
    --     },
    --   },
    -- }

    -- -- Setup neovim lua configuration
    -- require('neodev').setup()




    local navic = require("nvim-navic")



    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- -- Ensure the servers above are installed
    -- local mason_lspconfig = require 'mason-lspconfig'

    -- mason_lspconfig.setup {
    --   ensure_installed = vim.tbl_keys(servers),
    -- }

    -- mason_lspconfig.setup_handlers {
    --   function(server_name)
    --     require('lspconfig')[server_name].setup {
    --       capabilities = capabilities,
    --       on_attach = on_attach,
    --       settings = servers[server_name],
    --       filetypes = (servers[server_name] or {}).filetypes,
    --     }
    --   end,
    -- }

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local lspconfig = require("lspconfig")

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          -- cmd = { 'lua-language-server.cmd'},
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        })
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
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
        -- local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
        -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ss', require('telescope.builtin').lsp_document_symbols, '[S]earch [S]ymbols')
        nmap('<leader>wy', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace S[y]mbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        nmap('<leader>sd', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics')
        nmap('<leader>sD', "<cmd>Telescope diagnostics bufnr=0<CR>", '[S]earch [D]iagnostics for file')
        nmap('<leader>do', vim.diagnostic.open_float, '[D]iagnostic [O]pen float/line')
        nmap('<leader>dl', vim.diagnostic.setloclist, '[D]iagnostic [L]ist')
        nmap('[d', vim.diagnostic.goto_prev, 'Goto previous dianostic message')
        nmap(']d', vim.diagnostic.goto_prev, 'Goto next dianostic message')
        nmap('<leader>lr', ':LspRestart<CR>', '[L]SP [R]estart')

        -- -- Create a command `:Format` local to the LSP buffer
        -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        --   vim.lsp.buf.format()
        -- end, { desc = 'Format current buffer with LSP' })

        -- opts.desc = "Show LSP references"
        -- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        -- opts.desc = "Go to declaration"
        -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        -- opts.desc = "Show LSP definitions"
        -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        -- opts.desc = "Show LSP implementations"
        -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        -- opts.desc = "Show LSP type definitions"
        -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        -- opts.desc = "See available code actions"
        -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        -- opts.desc = "Smart rename"
        -- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        -- opts.desc = "Show buffer diagnostics"
        -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        -- opts.desc = "Show line diagnostics"
        -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        -- opts.desc = "Go to previous diagnostic"
        -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        -- opts.desc = "Go to next diagnostic"
        -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        -- opts.desc = "Show documentation for what is under cursor"
        -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        -- opts.desc = "Restart LSP"
        -- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })
  end
}
