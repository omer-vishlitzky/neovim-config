vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Center search results
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })

-- Paste over currently selected text without yanking it
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

vim.keymap.set("t", "<C-c>", "<Esc>", { buffer = 0 })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -3<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +3<CR>")
vim.keymap.set("n", "<S-Up>", "<cmd>resize -3<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize +3<CR>")
--
-- Normal mode: use word under cursor
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Visual mode: use selected text
vim.keymap.set("x", "<leader>ss", [[y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>]])vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "[S]ource" })

-- Switch window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k<CR>", { noremap = true, silent = true })

-- diff
vim.keymap.set("n", "<leader>dg", "<cmd>diffget<cr>")
vim.keymap.set("n", "<leader>dp", "<cmd>diffput<cr>")

vim.keymap.set("n", "]q", ":cnext<cr>", { desc = "Next Quickfix Item" })
vim.keymap.set("n", "[q", ":cprevious<cr>", { desc = "Previous Quickfix Item" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "[D", function()
  vim.diagnostic.jump({
    count = -1,
    severity = vim.diagnostic.severity.ERROR
  })
end, { desc = "Go to previous error" })

vim.keymap.set("n", "]D", function()
  vim.diagnostic.jump({
    count = 1,
    severity = vim.diagnostic.severity.ERROR
  })
end, { desc = "Go to next error" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })


vim.keymap.set("n", "<leader>ya", ":%!toyaml<CR>:set filetype=yaml<CR>")
vim.keymap.set("n", "<leader>yf", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
end, { desc = "Yank file path into clipboard" })

