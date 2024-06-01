return {
  "mfussenegger/nvim-dap",
  "jay-babu/mason-nvim-dap.nvim",
  opts = {},
  enabled = false,
  config = function()
    vim.api.nvim_set_keymap("n", "<F5>", ":DapContinue<CR>", { noremap = true, silent = true, expr = false, desc = "Debug" })
    vim.api.nvim_set_keymap("n", "<F6>", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true, expr = false, desc = "Toggle Breakpoint" })
    vim.api.nvim_set_keymap("n", "<F7>", ":DapStepInto<CR>", { noremap = true, silent = true, expr = false, desc = "Step Into" })
    vim.api.nvim_set_keymap("n", "<F8>", ":DapStepOver<CR>", { noremap = true, silent = true, expr = false, desc = "Step Over" })
    vim.api.nvim_set_keymap("n", "<F9>", ":DapStepOut<CR>", { noremap = true, silent = true, expr = false, desc = "Step Out" })
    vim.api.nvim_set_keymap("n", "<F10>", ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true, expr = false, desc = "Toggle Debug UI" })
  end
}
