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
  config = function()
    local neotest = require("neotest")

    ---@type neotest.Config
    local cfg = {
      adapters = {
        require("neotest-python")({
           dap = { justMyCode = false }
        }),
      },
      log_level = 3
    }
    neotest.setup(cfg)
  end,
}
