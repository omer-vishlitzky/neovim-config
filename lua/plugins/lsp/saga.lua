return {
  'nvimdev/lspsaga.nvim',
  opts = {
    lightbulb = { enable = false },
    callhierarchy = {
      layout = "normal"
    }
  },
  keys = {
    { "<leader>li", "<Cmd>Lspsaga incoming_calls<CR>", desc = "[L]spsaga [I]ncoming calls" },
    { "<leader>lo", "<Cmd>Lspsaga outgoing_calls<CR>", desc = "[L]spsaga [O]utgoing calls" },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}
