return {
  "lewis6991/gitsigns.nvim",
  event = { "VeryLazy" },
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
      end, { desc = "[H]unk [S]tage" })
      vim.keymap.set("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "[H]unk [R]eset" })
      vim.keymap.set("n", "<leader>bs", "<CMD>Gitsigns stage_buffer<CR>", { desc = "[B]uffer [S]tage" })
      vim.keymap.set("n", "<leader>br", "<CMD>Gitsigns reset_buffer<CR>", { desc = "[B]uffer [R]eset" })
      vim.keymap.set("n", "<leader>bi", "<CMD>Gitsigns reset_buffer_index<CR>", { desc = "[B]uffer reset [I]ndex" })
      vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git [B]lame" })
      vim.keymap.set("n", "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>", { desc = "[H]unk [P]review" })

      -- Diff with branch using FZF (toggle)
      vim.keymap.set("n", "<leader>hd", function()
        -- Check if we're in diff mode
        if vim.wo.diff then
          -- Close the diff
          vim.cmd('wincmd o')  -- Close other windows
          vim.cmd('diffoff')
        else
          require('fzf-lua').git_branches({
            prompt = "Select branch to diff> ",
            actions = {
              ['default'] = function(selected)
                local branch = selected[1]:match("^%*?%s*(.-)%s*$")
                gitsigns.diffthis(branch)
              end
            }
          })
        end
      end, { desc = "[H]unk [D]iff with branch (toggle)" })

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
