return {
  "rcarriga/nvim-notify",
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(...)
      vim.notify = require("notify")
      vim.notify(...)
    end
    vim.keymap.set("n", "<leader>dn", function()
      require("notify").dismiss({ silent = true, pending = true })
    end, { desc = "[D]ismiss [N]otifications" })
  end,
}
