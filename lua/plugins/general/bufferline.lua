return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {},
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        truncate_names = false
      }
    })
  end
}
