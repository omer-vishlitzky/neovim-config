return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      vim.keymap.set("n", "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>", { desc = "[H]unk [S]tage" })
      vim.keymap.set("n", "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "[H]unk [R]eset" })
      vim.keymap.set("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      vim.keymap.set("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      vim.keymap.set("n", "<leader>bs", "<CMD>Gitsigns stage_buffer<CR>", { desc = "[B]uffer [S]tage" })
      vim.keymap.set("n", "<leader>br", "<CMD>Gitsigns reset_buffer<CR>", { desc = "[B]uffer [R]eset" })
      vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git [B]lame" })
      vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "[H]unk [D]iff" })
      vim.keymap.set("n", "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>", { desc = "[H]unk [P]review" })
      -- don't override the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns
      vim.keymap.set({ "n", "v" }, "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr, desc = "Next Hunk" })
      vim.keymap.set({ "n", "v" }, "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr, desc = "Previous Hunk" })
    end,
  },
}
