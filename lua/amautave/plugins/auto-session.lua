return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      log_level = 'error',
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    }

    local keymap = vim.keymap

    keymap.set('n', '<leader>sr', '<cmd>SessionRestore<CR>', { desc = 'Workspace [S]ession [R]estore' }) -- restore last workspace session for current directory
    keymap.set('n', '<leader>ss', '<cmd>SessionSave<CR>', { desc = 'Workspace [S]ession [S]ave' }) -- save workspace session for current working directory
    keymap.set('n', '<leader>sl', require('auto-session.session-lens').search_session, { desc = 'Workspace [S]ession [L]ist', noremap = true })
  end,
}

