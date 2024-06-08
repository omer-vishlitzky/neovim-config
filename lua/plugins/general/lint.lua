return {
  "mfussenegger/nvim-lint",
  lazy = false,
  enabled = false,
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      python = { "ruff" },
    }
    vim.keymap.set("n", "<leader>ll", require('lint').try_lint, { desc = "asdasd" })
  end,
}
