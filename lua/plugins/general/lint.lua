return {
  "mfussenegger/nvim-lint",
  keys = {
    { "<leader>ll" }
  },
  config = function()
    require("lint").linters_by_ft = {
      python = { "ruff" },
      lua = { "luacheck" },
    }
    vim.keymap.set("n", "<leader>ll", function()
      require("lint").try_lint()
    end, { desc = "Lint!!!" })
  end,
}
