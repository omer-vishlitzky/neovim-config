vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Center search results
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })

-- Paste over currently selected text without yanking it
-- vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

--
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -3<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +3<CR>")
vim.keymap.set("n", "<S-Up>", "<cmd>resize -3<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize +3<CR>")
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader><leader>", function()
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


-- Create the command
vim.api.nvim_create_user_command('OpenGitModified', function()
    -- Get git status output
    local git_output = vim.fn.system('git status --porcelain')
    -- Split into lines and filter empty ones
    local modified_files = vim.split(git_output, '\n')
    -- Open each modified file
    for _, file in ipairs(modified_files) do
        if file ~= '' then
            -- Extract filename from git status output
            local filename = string.gsub(file, '^.. ', '')
            -- Open the file
            vim.cmd('edit ' .. filename)
        end
    end
end, {})
vim.keymap.set("n", "<leader>ba", ":OpenGitModified<CR>")
