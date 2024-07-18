return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    local mappings = {
      { "<leader>c", group = "[C]ode" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>h", group = "[H]unk" },
      { "<leader>j", group = "[J]son" },
      { "<leader>l", group = "[L]sp" },
      { "<leader>r", group = "[R]efactor/[R]esume/[R]eset" },
      { "<leader>t", group = "[T]oggle" },
    }
    ---@type wk.Opts
    local cfg = {
      preset = "classic"
    }
    wk.add(mappings, {})
    wk.setup(cfg)
  end
}
