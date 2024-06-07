return {
  "mfussenegger/nvim-lint",
  lazy = false,
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      python = { "mypy", "flake8" },
    }
    vim.keymap.set("n", "<leader>ll", require('lint').try_lint, { desc = "asdasd"})
  end,
}
