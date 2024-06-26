return {
  "folke/which-key.nvim",
  opts = {},
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.register({
      l = { name = "[L]sp" },
      c = { name = "[C]ode" },
      h = { name = "[H]unk" },
      f = { name = "[F]ind" },
      r = { name = "[R]efactor/[R]esume/[R]eset" },
      j = { name = "[J]son" },
      t = { name = "[T]oggle" },
    }, { prefix = "<leader>" })
  end,
}
