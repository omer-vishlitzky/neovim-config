return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        go = true,
        c = true,
      },
      prompt_func_param_type = {
        go = true,
        c = true,
        python = false,
      },
      show_success_message = true,
      below = true,
    })
  end,
  keys = {
    { "<leader>rf", function() return require("refactoring").refactor("Extract Function") end, mode = { "n", "x" }, expr = true },
    { "<leader>rv", function() return require("refactoring").refactor("Extract Variable") end, mode = { "n", "x" }, expr = true },
    { "<leader>rI", function() return require("refactoring").refactor("Inline Function") end,  mode = { "n", "x" }, expr = true },
    { "<leader>ri", function() return require("refactoring").refactor("Inline Variable") end,  mode = { "n", "x" }, expr = true },
  },
}
