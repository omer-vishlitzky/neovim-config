local grp = vim.api.nvim_create_augroup("DiffviewCursorToggle", { clear = true })

-- Track Diffview sessions
vim.api.nvim_create_autocmd("User", {
  pattern = "DiffviewOpen",
  group = grp,
  callback = function() vim.g.diffview_active = true end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "DiffviewClose",
  group = grp,
  callback = function() vim.g.diffview_active = false end,
})

-- On every window switch, toggle cursorline if it's a diff pane in a Diffview session
vim.api.nvim_create_autocmd("WinEnter", {
  group = grp,
  callback = function()
    if vim.g.diffview_active and vim.wo.diff then
      vim.wo.cursorline = false
    else
      vim.wo.cursorline = true
    end
  end,
})

