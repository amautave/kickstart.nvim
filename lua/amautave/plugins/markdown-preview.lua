--------------------------------------------------------------------------------
-- Markdown Previewer
--------------------------------------------------------------------------------

-- return {
--   'iamcco/markdown-preview.nvim',
--   ft = 'markdown',
--   build = function()
--     vim.fn['mkdp#util#install']()
--   end,
--   cmd = {
--     'MarkdownPreviewToggle',
--     'MarkdownPreview',
--     'MarkdownPreviewStop',
--   },
-- }
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && npm install --no-package-lock', -- For unix terminal
  -- build = 'cd app ; npm install', -- For Windows terminal
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}
