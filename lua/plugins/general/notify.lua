return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>dn",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
  },
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(...)
      vim.notify = require("notify")
      vim.notify(...)
    end
  end,
}
