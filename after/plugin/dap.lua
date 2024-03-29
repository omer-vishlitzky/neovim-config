local dap = require('dap')
local dapui = require("dapui").setup()

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
      command = '/home/omer/.local/share/nvim/mason/packages/debugpy/venv/bin/python3.10',
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
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
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
        return '/usr/bin/python3.10'
      end
    end;
  },
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.npm-global/lib/node_modules/node-debug2-adapter/out/src/DebugAdapter.js'},
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/dist/${fileBasenameNoExtension}.js',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    skipFiles = {'<node_internals>/**'},
  },
}


vim.api.nvim_set_keymap("n", "<F5>", ":DapContinue<CR>", { noremap = true, silent = true, expr = false, desc = "Debug" })
vim.api.nvim_set_keymap("n", "<F6>", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true, expr = false, desc = "Toggle Breakpoint" })
vim.api.nvim_set_keymap("n", "<F7>", ":DapStepInto<CR>", { noremap = true, silent = true, expr = false, desc = "Step Into" })
vim.api.nvim_set_keymap("n", "<F8>", ":DapStepOver<CR>", { noremap = true, silent = true, expr = false, desc = "Step Over" })
vim.api.nvim_set_keymap("n", "<F9>", ":DapStepOut<CR>", { noremap = true, silent = true, expr = false, desc = "Step Out" })
vim.api.nvim_set_keymap("n", "<F10>", ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true, expr = false, desc = "Toggle Debug UI" })
