return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "Neotest",
  },
  keys = {
    { "<leader>ts", "<cmd>Neotest summary<cr>",      { desc = "[T]est [S]ummary" } },
    { "<leader>tr", "<cmd>Neotest run<cr>",          { desc = "[T]est [R]un" } },
    { "<leader>tf", "<cmd>Neotest run file<cr>",          { desc = "[T]est run [F]ile" } },
    { "<leader>to", "<cmd>Neotest output<cr>",       { desc = "[T]est [O]utput" } },
    { "<leader>tO", "<cmd>Neotest output-panel<cr>", { desc = "[T]est [O]utput panel" } },
    { "<leader>tn", "<cmd>Neotest jump next<cr>",    { desc = "[T]est [N]ext" } },
    { "<leader>tp", "<cmd>Neotest jump prev<cr>",    { desc = "[T]est [P]rev" } },
    { "<leader>tl", "<cmd>Neotest run last<cr>",    { desc = "[T]est [L]ast" } },

  },
  config = function()
    local neotest = require("neotest")

    ---@type neotest.Config
    local cfg = {
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
      },
      log_level = 3
    }
    neotest.setup(cfg)
  end,
}
