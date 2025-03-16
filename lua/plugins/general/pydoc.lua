return {
  "fredrikaverpil/pydoc.nvim",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "markdown" },
      },
    },
  },
  cmd = { "PyDoc" },
  opts = {},
}
