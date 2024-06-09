return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>",   desc = "NvimTreeToggle" },
    { "<C-f>", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTreeFindFile" },
  },
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
