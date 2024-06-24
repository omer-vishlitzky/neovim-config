return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",                 desc = "[B]uffer pin" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",               desc = "[B]uffers delete [O]thers" },
    { "<leader>bd", "<Cmd>bd<CR>",                                  desc = "[B]uffer [D]elete" },
    { "<leader>bf", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "[B]uffer Fuzzy [F]ind" },
    { "<leader>bc", "<Cmd>Telescope git_bcommits<CR>",              desc = "[B]uffer [C]ommits" },
    { "<leader>bl", "<Cmd>Telescope buffers<CR>",                   desc = "[B]uffer [L]ist" },
    { "[b",         "<cmd>BufferLineCyclePrev<CR>",                 desc = "Prev Buffer" },
    { "]b",         "<cmd>BufferLineCycleNext<CR>",                 desc = "Next Buffer" },
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
