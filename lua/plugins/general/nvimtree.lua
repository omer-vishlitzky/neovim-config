vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  init = function()
--      vim.notify("nvimtree executed at startup")
      vim.notify("nvimtree executed at startup")
  end,
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" },
  },
  opts = {},
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  }
}
