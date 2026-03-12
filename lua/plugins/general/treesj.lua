return {
  "Wansmer/treesj",
  keys = {
    {
      "<leader>m",
      mode = { "n" },
      desc = "Toggle Fold",
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    max_join_length = 900,
  },
}
