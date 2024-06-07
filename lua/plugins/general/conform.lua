return {
  "stevearc/conform.nvim",
  opts = {},
  lazy = false,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      formatters = {
        black = {
          command = "~/.local/bin/black"
        },
        isort = {
          command = "~/.local/bin/isort"
        }
      }
    })
  end,
}
