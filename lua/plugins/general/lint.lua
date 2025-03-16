return {
  "mfussenegger/nvim-lint",
  keys = {
    { "<leader>cl" }
  },
  config = function()
    local lint = require("lint")


    lint.linters_by_ft = {
      python = { "ruff", "flake8", "mypy" },
      lua = { "luacheck" },
      go = { "golangcilint" },
    }

    vim.keymap.set("n", "<leader>cl", function()
      require("lint").try_lint()
    end, { desc = "[C]ode [L]int" })
  end,
}
