vim.g.mapleader = " "


-- Center search results
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })

-- Paste over currently selected text without yanking it
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Switch buffer
vim.api.nvim_set_keymap("n", "<Right>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", ":bprevious<CR>", { noremap = true, silent = true })

-- Switch window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k<CR>", { noremap = true, silent = true })
