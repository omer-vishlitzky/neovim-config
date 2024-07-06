return {
  "mfussenegger/nvim-lint",
  enabled = false,
  config = function()
    require("lint").linters_by_ft = {
      python = { "mypy", "flake8", "pylint", "pycodestyle", "ruff" },
    }
    vim.keymap.set("n", "<leader>ll", function()
      require("lint").try_lint()
    end, { desc = "Lint!!!" })
  end,
}
