return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python"
  },
  keys = {
    -- Debug control keymaps
    { "<F5>",       "<CMD>DapContinue<CR>",                                                                     mode = "n",                       desc = "Debug" },
    { "<F6>",       "<CMD>DapToggleBreakpoint<CR>",                                                             mode = "n",                       desc = "Toggle Breakpoint" },
    { "<F7>",       "<CMD>DapStepInto<CR>",                                                                     mode = "n",                       desc = "Step Into" },
    { "<F8>",       "<CMD>DapStepOver<CR>",                                                                     mode = "n",                       desc = "Step Over" },
    { "<F9>",       "<CMD>DapStepOut<CR>",                                                                      mode = "n",                       desc = "Step Out" },

    -- DAP UI individual element keymaps (as floating windows)
    -- Add this to your keymaps
    { "<leader>xt", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads) end, desc = "Debug [T]hreads" },
    { "<leader>xv", function() require("dapui").float_element("scopes") end,                                    desc = "Debug [V]ariables" },
    { "<leader>xs", function() require("dapui").float_element("stacks") end,                                    desc = "Debug [S]tacks" },
    { "<leader>xb", function() require("dapui").float_element("breakpoints") end,                               desc = "Debug [B]reakpoints" },
    { "<leader>xw", function() require("dapui").float_element("watches") end,                                   desc = "Debug [W]atches" },
    { "<leader>xr", function() require("dapui").float_element("repl") end,                                      desc = "Debug [R]EPL" },
    { "<leader>xc", function() require("dapui").float_element("console") end,                                   desc = "Debug [C]onsole" },

    -- Toggle layouts
    { "<leader>xu", function() require("dapui").toggle() end,                                                   desc = "Toggle Debug [U]I" },
    { "<leader>xl", function() require("dapui").toggle({ layout = 1 }) end,                                     desc = "Toggle Debug [L]eft UI" },
    { "<leader>xo", function() require("dapui").toggle({ layout = 2 }) end,                                     desc = "Toggle Debug B[o]ttom UI" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.defaults.fallback.focus_terminal = true
    dap.defaults.fallback.auto_continue_if_many_stopped = false
    -- Configure DAP UI with empty layouts by default
    ---@type dapui.config
    ---@diagnostic disable-next-line: missing-fields
    local cfg = {
      ---@diagnostic disable-next-line: missing-fields
      floating = {
        max_height = 80,
        max_width = 80,
      }

    }
    dapui.setup(cfg)

    require("dap-python").setup("python3")
    require('dap-go').setup()

    -- Recommended: Set up specific signs for breakpoints
    vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = '', linehl = '', numhl = '' })
  end,
}
