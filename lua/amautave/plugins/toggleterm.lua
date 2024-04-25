-- vim.cmd [[let &shell = 'C:\Program Files\Git\bin\bash.exe']]
-- vim.cmd [[let &shellcmdflag = '-s']]

local powershell_options = {
  -- shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shell = vim.fn.executable 'powershell' == 1 and 'powershell' or 'pwsh',
  shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
  shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
  shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
  shellquote = '',
  shellxquote = '',
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'TermExec' },
  opts = {
    highlights = {
      Normal = { link = 'Normal' },
      NormalNC = { link = 'NormalNC' },
      NormalFloat = { link = 'NormalFloat' },
      FloatBorder = { link = 'FloatBorder' },
      StatusLine = { link = 'StatusLine' },
      StatusLineNC = { link = 'StatusLineNC' },
      WinBar = { link = 'WinBar' },
      WinBarNC = { link = 'WinBarNC' },
    },
    size = 10,
    on_create = function()
      vim.opt.foldcolumn = '0'
      vim.opt.signcolumn = 'no'
    end,
    open_mapping = [[<C-t>]],
    shading_factor = 2,
    direction = 'float',
    float_opts = { border = 'rounded' },
  },
}
