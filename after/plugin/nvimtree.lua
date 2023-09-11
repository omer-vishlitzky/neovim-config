local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
    },
    filters = {
      custom = { ".git" },
    },
  }
end

vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<S-Up>', '<cmd>resize +2<CR>', { noremap = true })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +2<CR>', { noremap = true })

return M
