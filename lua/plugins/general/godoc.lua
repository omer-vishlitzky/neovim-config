return {
  "fredrikaverpil/godoc.nvim",
  version = "*",
  dependencies = {
    { "ibhagwan/fzf-lua" }, -- optional
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "go" },
      },
    },
  },
  build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
  cmd = { "GoDoc" },                                                 -- optional
  opts = {},                                                         -- see further down below for configuration
}
