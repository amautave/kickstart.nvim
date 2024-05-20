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
  -- build = 'cd app && npm install', -- For unix OS
  build = 'cd app ; npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}
