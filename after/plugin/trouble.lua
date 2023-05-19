-- Lua
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true},
  {description = "workspace_diagnostics"}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true},
  {description = "document_diagnostics"}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true},
  {description = "loclist"}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true},
  {description = "quickfix"}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true},
  {description = "lsp_references"}
)
