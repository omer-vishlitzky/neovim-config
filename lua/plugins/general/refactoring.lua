return {
  "ThePrimeagen/refactoring.nvim",
  cmd = {
    "Refactor",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        go = true,
        c = true,
        python = true,
      },
      prompt_func_param_type = {
        go = true,
        c = true,
        python = true,
      },
      show_success_message = true,
      below = true,
    })
    vim.keymap.set("v", "<leader>re", ":Refactor extract ")
    vim.keymap.set("v", "<leader>rv", ":Refactor extract_var ")
    vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
    vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
  end,
}
