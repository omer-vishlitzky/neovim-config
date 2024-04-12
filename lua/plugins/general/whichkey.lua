return {
  'folke/which-key.nvim',
  opts = {},
  lazy = false,
  config = function()
    local wk = require("which-key")
    wk.register({
      l = { name = "[L]sp" },
      c = { name = "[C]ode" },
      f = { name = "[F]ind" },
      r = { name = "[R]efactoring" },
      t = { name = "[T]oggle" },
    }, { prefix = "<leader>" })
  end
}
