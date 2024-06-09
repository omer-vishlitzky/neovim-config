return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",   desc = "[B]uffer pin" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "[B]uffers delete others" },
    { "<leader>bd", "<Cmd>bd<CR>",                    desc = "[B]uffer delete" },
    { "[b",         "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev Buffer" },
    { "]b",         "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
  },
  opts = {},
  config = function()
    require("bufferline").setup({
      options = {
        truncate_names = false,
      },
    })
  end,
}
