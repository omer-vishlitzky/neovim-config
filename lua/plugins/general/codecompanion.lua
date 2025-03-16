return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "${CLAUDE_API_KEY}",
          },
          schema = {
            model = {
              default = "claude-3-5-sonnet-20241022",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
      },
    },
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", mode = {"x", "n"}},
    { "<leader>aa", "<cmd>CodeCompanionAction<cr>", mode = {"x", "n"}},
  }
}
