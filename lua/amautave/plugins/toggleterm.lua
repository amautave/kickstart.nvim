vim.cmd [[let &shell = 'C:\Program Files\Git\bin\bash.exe']]
vim.cmd [[let &shellcmdflag = '-s']]

return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    highlights = {
      Normal = { link = "Normal" },
      NormalNC = { link = "NormalNC" },
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
      StatusLine = { link = "StatusLine" },
      StatusLineNC = { link = "StatusLineNC" },
      WinBar = { link = "WinBar" },
      WinBarNC = { link = "WinBarNC" },
    },
    size = 10,
    on_create = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
    end,
    open_mapping = [[<C-\>]],
    shading_factor = 2,
    direction = "float",
    float_opts = { border = "rounded" },
  },
}
