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
    local dap = require("dap")
    local dapui = require("dapui").setup()
    dap.adapters.python = function(cb, config)
      if config.request == "attach" then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or "127.0.0.1"
        cb({
          type = "server",
          port = assert(port, "`connect.port` is required for a python `attach` configuration"),
          host = host,
          options = {
            source_filetype = "python",
          },
        })
      else
        local venv_path = os.getenv("VIRTUAL_ENV")
        local python_executable = venv_path and venv_path .. "/bin/python" or "/usr/bin/python"
        cb({
          type = "executable",
          command = python_executable,
          args = { "-m", "debugpy.adapter" },
          options = {
            source_filetype = "python",
          },
        })
      end
    end
    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",
        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
          end
        end,
      },
    }
  end,
}
