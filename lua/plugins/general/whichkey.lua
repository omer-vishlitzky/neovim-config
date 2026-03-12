return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    local mappings = {
      { "<leader>b", group = "[B]uffer" },
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]iff" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>h", group = "[H]unk" },
      { "<leader>j", group = "[J]son" },
      { "<leader>l", group = "[L]sp" },
      { "<leader>r", group = "[R]efactor/[R]esume/[R]eset" },
      { "<leader>s", group = "[S]wap/[S]ubstitute" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>y", group = "[Y]ank" },
    }
    ---@type wk.Opts
    local cfg = {
      preset = "modern"
    }
    wk.add(mappings, {})
    wk.setup(cfg)
  end
}
