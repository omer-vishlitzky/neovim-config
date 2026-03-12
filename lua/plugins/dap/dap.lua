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
    { "<F5>",  "<CMD>DapContinue<CR>",         mode = "n", desc = "Debug Continue/Start" },
    { "<F6>",  "<CMD>DapToggleBreakpoint<CR>", mode = "n", desc = "Toggle Breakpoint" },
    { "<F7>",  "<CMD>DapStepInto<CR>",         mode = "n", desc = "Step Into" },
    { "<F8>",  "<CMD>DapStepOver<CR>",         mode = "n", desc = "Step Over" },
    { "<F9>",  "<CMD>DapStepOut<CR>",          mode = "n", desc = "Step Out" },
    { "<F10>", "<CMD>DapTerminate<CR>",        mode = "n", desc = "Terminate Debug" },
    {
      "<leader>dbc",
      function()
        local condition = vim.fn.input("Breakpoint condition: ")
        if condition ~= "" then
          require("dap").set_breakpoint(condition)
        end
      end,
      mode = "n",
      desc = "Set [D]ebug [B]reakpoint [C]onditional"
    },

    {
      "<leader>xv",
      function()
        local dapui = require("dapui")
        local windows = require("dapui.windows")
        if windows.layouts[3] and windows.layouts[3]:is_open() then
          dapui.close({ layout = 3 })
        else
          dapui.close()
          dapui.open({ layout = 3 })
        end
      end,
      desc = "Toggle Debug [V]ariables (scopes)"
    },
    { "<leader>xV", "<CMD>FzfLua dap_variables<CR>", desc = "Toggle Debug [V]ariables (scopes)" },
    { "<leader>xb", "<CMD>FzfLua dap_breakpoints<CR>", desc = "Toggle Debug [V]ariables (scopes)" },
    {
      "<leader>xc",
      function()
        local dapui = require("dapui")
        local windows = require("dapui.windows")
        if windows.layouts[6] and windows.layouts[6]:is_open() then
          dapui.close({ layout = 6 })
        else
          dapui.close()
          dapui.open({ layout = 6 })
        end
      end,
      desc = "Toggle Debug [C]onsole"
    },
    {
      "<leader>xr",
      function()
        local dapui = require("dapui")
        local windows = require("dapui.windows")
        if windows.layouts[7] and windows.layouts[7]:is_open() then
          dapui.close({ layout = 7 })
        else
          dapui.close()
          dapui.open({ layout = 7 })
        end
      end,
      desc = "Toggle Debug [R]epl"
    },
    -- Toggle layouts
    { "<leader>xu", function() require("dapui").toggle({ layout = 1 }) require("dapui").toggle({ layout = 2 }) end, desc = "Toggle Debug [U]I" },
    { "<leader>xd", function() require("dapui").toggle({ layout = 8 }) end, desc = "Toggle Debug Controls Bar" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Configure DAP UI with custom layouts
    ---@type dapui.config
    ---@diagnostic disable-next-line: missing-fields

    local cfg = {
      controls = {
        enabled = true,
        element = "repl",
      },
      layouts = {
        -- Main layout for <leader>xu - standard debug UI
        {
          elements = {
            { id = "scopes",      size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks",      size = 0.25 },
            { id = "watches",     size = 0.25 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            { id = "repl",    size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 10,
          position = "bottom",
        },
        -- Individual element layouts (indices 3-8) for specific toggles
        {
          elements = { "scopes" },
          size = 15,
          position = "bottom",
        },
        {
          elements = { "stacks" },
          size = 15,
          position = "bottom",
        },
        {
          elements = { "breakpoints" },
          size = 15,
          position = "bottom",
        },
        {
          elements = { "console" },
          size = 15,
          position = "bottom",
        },
        {
          elements = { "repl" },
          size = 15,
          position = "bottom",
        },
        -- Minimal controls-only layout
        {
          elements = { "repl" },
          size = 1,
          position = "bottom",
        },
      },
      -- rest of your config...
    }

    dapui.setup(cfg)

    -- Python DAP configuration with asyncio/threading control
    require("dap-python").setup()
    require('dap-go').setup()

    local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.cpp = dap.configurations.c

    vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = '', linehl = '', numhl = '' })
  end,
}
