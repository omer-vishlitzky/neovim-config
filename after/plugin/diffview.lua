-- Store diffview state
vim.g.diffview_open = false

-- Toggle diffview function
function _G.toggle_diffview(diff_target)
  if vim.g.diffview_open then
    vim.cmd('DiffviewClose')
    vim.g.diffview_open = false
  else
    if diff_target and #diff_target > 0 then
      vim.cmd('DiffviewOpen ' .. diff_target)
    else
      vim.cmd('DiffviewOpen')
    end
    vim.g.diffview_open = true
  end
end

-- Map the command
vim.cmd('command! -nargs=? DiffviewToggle lua toggle_diffview(<q-args>)')

vim.api.nvim_set_keymap("n", "<Leader>dl", "<CMD>DiffviewToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>do", "<CMD>DiffviewToggle @{u}<CR>", {})
