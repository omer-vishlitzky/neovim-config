vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" },
  },
  config = function()
    require("nvim-tree").setup()
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  }
}
