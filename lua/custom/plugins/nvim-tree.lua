return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        number = true,
        relativenumber = true,
      },
      filters = {
        custom = { ".git" },
      },
    }
  end,
}
