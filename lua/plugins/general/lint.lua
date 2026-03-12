return {
  "mfussenegger/nvim-lint",
  keys = {
    { "<leader>cl" }
  },
  config = function()
    local lint = require("lint")


    lint.linters_by_ft = {
      python = { "ruff" },
      lua = { "luacheck" },
      go = { "golangci-lint" },
      ansible = { "ansible-lint" }
    }

    vim.keymap.set("n", "<leader>cl", function()
      require("lint").try_lint()
    end, { desc = "[C]ode [L]int" })
  end,
}
