return {
  "sindrets/diffview.nvim",
  cmd = { "DiffViewOpen" },
  keys = {
    {
      "<leader>dv",
      function()
        local lib = require('diffview.lib')
        if lib.get_current_view() then
          vim.cmd('DiffviewClose')
        else
          vim.cmd('DiffviewOpen')
        end
      end,
      desc = "Toggle DiffView"
    },
  },
  ---@type DiffviewConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      default = {
        layout = "diff2_horizontal",
      },
    },
    keymaps = {
      view = {
        { "n", "<leader>td", function()
          if vim.wo.diff then
            vim.cmd("windo diffoff")
          else
            vim.cmd("windo diffthis")
          end
        end, { desc = "Toggle diff rendering" } },
      },
    },
  },
}
