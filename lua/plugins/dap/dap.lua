return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    { "<F5>",  "<CMD>DapContinue<CR>",                   mode = "n", desc = "Debug" },
    { "<F6>",  "<CMD>DapToggleBreakpoint<CR>",           mode = "n", desc = "Toggle Breakpoint" },
    { "<F7>",  "<CMD>DapStepInto<CR>",                   mode = "n", desc = "Step Into" },
    { "<F8>",  "<CMD>DapStepOver<CR>",                   mode = "n", desc = "Step Over" },
    { "<F9>",  "<CMD>DapStepOut<CR>",                    mode = "n", desc = "Step Out" },
    { "<F10>", "<CMD>lua require('dapui').toggle()<CR>", mode = "n", desc = "Toggle Debug UI" },
  },
  config = function()
    local dap = require('dap')
    local dapui = require("dapui").setup()
    -- #### HERE
    dap.adapters.python = function(cb, config)
      if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
          type = 'server',
          port = assert(port, '`connect.port` is required for a python `attach` configuration'),
          host = host,
          options = {
            source_filetype = 'python',
          },
        })
      else
        cb({
          type = 'executable',
          command = os.getenv("VIRTUAL_ENV") .. "/bin/python",
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          },
        })
      end
    end
    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",
        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end,
      },


    }
    local debug = function()
      dap.run({
        type = "python",
        request = "launch",
        name = "Download Logs",
        module = "src.assisted_test_infra.download_logs",
        args = { "https://api.openshift.com", ".logs/" },
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python3'
          end
        end,
      })
    end
    -- #### HERE
    vim.keymap.set("n", "<F11>", debug, { desc = "Debug" })
    vim.api.nvim_set_keymap("n", "<F5>", "<CMD>DapContinue<CR>", { desc = "Debug" })
    vim.api.nvim_set_keymap("n", "<F6>", "<CMD>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
    vim.api.nvim_set_keymap("n", "<F7>", "<CMD>DapStepInto<CR>", { desc = "Step Into" })
    vim.api.nvim_set_keymap("n", "<F8>", "<CMD>DapStepOver<CR>", { desc = "Step Over" })
    vim.api.nvim_set_keymap("n", "<F9>", "<CMD>DapStepOut<CR>", { desc = "Step Out" })
    vim.api.nvim_set_keymap("n", "<F10>", "<CMD>lua require('dapui').toggle()<CR>", { desc = "Toggle Debug UI" })
  end
}
