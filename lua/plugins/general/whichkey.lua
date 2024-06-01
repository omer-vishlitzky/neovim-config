return {
  'folke/which-key.nvim',
  opts = {},
  lazy = false,
  config = function()
    local wk = require("which-key")
    wk.register({
      l = { name = "[L]sp" },
      c = { name = "[C]ode" },
      h = { name = "[H]unk" },
      f = { name = "[F]ind" },
      r = { name = "[R]efactoring" },
      j = { name = "[J]son" },
      t = { name = "[T]oggle" },
    }, { prefix = "<leader>" })
  end
}
