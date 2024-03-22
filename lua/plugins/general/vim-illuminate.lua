return {
  "RRethy/vim-illuminate",
  enabled = false,
  config = function()
    -- default configuration
    require('illuminate').configure({})
    -- vim.api.nvim_create_augroup("illuminate_autogrp", { clear = true })
    -- vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    --   group = "illuminate_autogrp",
    --   pattern = "*",
    --   callback = function()
    --     vim.api.nvim_command('highlight clear CursorLine')
    --     vim.api.nvim_command('highlight CursorLine guibg=#3c3836')
    --     vim.api.nvim_command('highlight clear IlluminatedWordText')
    --     vim.api.nvim_command('highlight clear IlluminatedWordRead')
    --     vim.api.nvim_command('highlight clear IlluminatedWordWrite')
    --     vim.api.nvim_command('highlight clear LspReferenceText')
    --     vim.api.nvim_command('highlight clear LspReferenceRead')
    --     vim.api.nvim_command('highlight clear LspReferenceWrite')
    --     vim.api.nvim_command('highlight link IlluminatedWordText LspReferenceText')
    --     vim.api.nvim_command('highlight link IlluminatedWordRead LspReferenceRead')
    --     vim.api.nvim_command('highlight link IlluminatedWordWrite LspReferenceWrite')
    --     vim.api.nvim_command('highlight link LspReferenceText CursorLine')
    --     vim.api.nvim_command('highlight link LspReferenceRead CursorLine')
    --     vim.api.nvim_command('highlight link LspReferenceWrite CursorLine')
    --   end
    -- })
  end
}
