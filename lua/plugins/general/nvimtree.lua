return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>",   desc = "NvimTreeToggle" },
    { "<C-f>", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTreeFindFile" },
  },
  config = function()
    local nvimtree = require("nvim-tree")
    local config = {
      filters = {
        dotfiles = false
      },
      actions = {
        open_file = {
          resize_window = false
        }
      }
    }
    nvimtree.setup(config)
  end
}
