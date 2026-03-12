return {
  'stevearc/conform.nvim',
  ---@module "conform.nvim"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff" },
      rust = { "rustfmt", lsp_format = "fallback" },
      go = { "gci", "gofumpt", "goimports", "gofmt" }
    },
    formatters = {
      ruff = {
        inherit = true,
      },
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
  },
  keys = {
    { "<leader>cf", function() require("conform").format({}) end, "[C]ode [F]ormat" },
  },
}
