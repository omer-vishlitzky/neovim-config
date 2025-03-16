return {
  "sindrets/diffview.nvim",
  opts = {},
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
}
