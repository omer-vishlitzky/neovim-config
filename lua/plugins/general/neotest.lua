---@diagnostic disable: missing-fields
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-contrib/nvim-ginkgo",
    { dir = "~/Desktop/projects/nvim-ginkgo" }, -- Use local fork with DAP support
  },
  cmd = {
    "Neotest",
  },
  keys = {
    { "<leader>ts", "<cmd>Neotest summary<cr>",                                      { desc = "[T]est [S]ummary" } },
    { "<leader>tr", "<cmd>Neotest run<cr>",                                          { desc = "[T]est [R]un" } },
    { "<leader>tf", "<cmd>Neotest run file<cr>",                                     { desc = "[T]est run [F]ile" } },
    { "<leader>to", "<cmd>Neotest output<cr>",                                       { desc = "[T]est [O]utput" } },
    { "<leader>tO", "<cmd>Neotest output-panel<cr>",                                 { desc = "[T]est [O]utput panel" } },
    { "<leader>tF", function()
      -- Load the formatter from the local nvim-ginkgo directory
      local formatter_path = vim.fn.expand("~/Desktop/projects/nvim-ginkgo/lua/nvim-ginkgo/output_formatter.lua")
      if vim.fn.filereadable(formatter_path) == 1 then
        dofile(formatter_path).format_current_output()
      else
        vim.notify("Output formatter not found", vim.log.levels.ERROR)
      end
    end, { desc = "[T]est [F]ormatted output" } },
    { "<leader>tn", "<cmd>Neotest jump next<cr>",                                    { desc = "[T]est [N]ext" } },
    { "<leader>tp", "<cmd>Neotest jump prev<cr>",                                    { desc = "[T]est [P]rev" } },
    { "<leader>tl", "<cmd>Neotest run last<cr>",                                     { desc = "[T]est [L]ast" } },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "[T]est [D]ebug" } },

    -- Go test mode keymaps (using standard go test command)
    { "<leader>tg", function()
      require("neotest").run.run({
        extra_args = { "-test.timeout=2m" },
      })
    end, { desc = "[T]est [G]o test mode with timeout" } },

    -- Debug with go test mode
    { "<leader>tD", function()
      require("neotest").run.run({
        strategy = "dap",
        extra_args = { "-test.timeout=10m" }, -- Longer timeout for debugging
      })
    end, { desc = "[T]est [D]ebug go test mode with longer timeout" } },
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
        concurrent = 0,
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
        require("nvim-ginkgo")({
          env = { SKIP_UT_DB = "1" },
        }),
      },
    }
    neotest.setup(cfg)
  end,
}

