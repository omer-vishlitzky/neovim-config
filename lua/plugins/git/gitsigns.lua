return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      -- vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

      vim.api.nvim_set_keymap("n", "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>", { desc = "[H]unk [S]tage" })
      vim.api.nvim_set_keymap("n", "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "[H]unk [R]eset" })
      vim.api.nvim_set_keymap("n", "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>", { desc = "[H]unk [P]review" })
      -- don't override the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns
      vim.keymap.set({ 'n', 'v' }, ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Next Hunk' })
      vim.keymap.set({ 'n', 'v' }, '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Previous Hunk' })
    end,
  },
}
