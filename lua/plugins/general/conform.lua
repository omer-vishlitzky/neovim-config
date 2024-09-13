return {
  'stevearc/conform.nvim',
  opts = {},
  keys = {
    { "<leader>cf" },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black", "flake8", "ruff" },
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "gci", "gofumpt", "goimports", "gofmt" }
      },
      formatters = {
        gci = {
          command = "gci",
          args = function(self, ctx)
            return {
              "write",
              "--skip-generated",
              "-s", "standard",
              "-s", "default",
              "-s", "prefix(k8s)",
              "-s", "prefix(sigs.k8s)",
              "-s", "prefix(github.com)",
              "-s", "prefix(gitlab)",
              "--custom-order",
              "$FILENAME"
            }
          end,
          stdin = false,
        },
      },
      vim.keymap.set("n", "<leader>cf", function()
        require("conform").format()
      end, { desc = "[C]ode [F]ormat" })
    })
  end
}
