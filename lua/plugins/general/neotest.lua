---@diagnostic disable: missing-fields
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-contrib/nvim-ginkgo",
    { "fredrikaverpil/neotest-golang", version = "*" },
  },
  cmd = {
    "Neotest",
  },
  keys = {
    { "<leader>ts", "<cmd>Neotest summary<cr>",      { desc = "[T]est [S]ummary" } },
    { "<leader>tr", "<cmd>Neotest run<cr>",          { desc = "[T]est [R]un" } },
    { "<leader>tf", "<cmd>Neotest run file<cr>",     { desc = "[T]est run [F]ile" } },
    { "<leader>to", "<cmd>Neotest output<cr>",       { desc = "[T]est [O]utput" } },
    { "<leader>tO", "<cmd>Neotest output-panel<cr>", { desc = "[T]est [O]utput panel" } },
    { "<leader>tn", "<cmd>Neotest jump next<cr>",    { desc = "[T]est [N]ext" } },
    { "<leader>tp", "<cmd>Neotest jump prev<cr>",    { desc = "[T]est [P]rev" } },
    { "<leader>tl", "<cmd>Neotest run last<cr>",     { desc = "[T]est [L]ast" } },
  },
  config = function()
    local neotest = require("neotest")
    ---@type neotest.Config
    local cfg = {
      log_level = vim.log.levels.INFO,
      quickfix = {
        enabled = false,
      },
      diagnostic = {
        enabled = true,
        severity = 1,
      },
      discovery = {
        concurrent = 0
      },
      floating = {
        border = "rounded",
        max_height = 0.8,
        max_width = 0.8,
        options = {},
      },
      status = {
        virtual_text = true,
        enabled = true,
        signs = true,
      },
      summary = {
        animated = true,
        enabled = true,
        expand_errors = false,
        open = "topleft vsplit | vertical resize 50",
        follow = true,
      },
      output = {
        open_on_run = false,
        enabled = true,
      },
      output_panel = {
        enabled = true,
      },
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
        require("nvim-ginkgo")
      },
    }
    neotest.setup(cfg)
  end,
}
