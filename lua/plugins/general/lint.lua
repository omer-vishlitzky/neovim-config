return {
  "mfussenegger/nvim-lint",
  keys = {
    { "<leader>cl" }
  },
  config = function()
    local lint = require("lint")

    -- Helper function to get golangci-lint args based on config presence
    local function get_golangci_args()
      local base_args = {
        'run',
        '--fast',
        '--out-format=json',
      }

      -- Check if project-specific config exists
      if vim.fn.filereadable(vim.fn.getcwd() .. '/.golangci.yml') == 1 then
        table.insert(base_args, '--config=.golangci.yml')
      end

      return base_args
    end

    -- Configure golangci-lint
    lint.linters.golangcilint.args = get_golangci_args()

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
