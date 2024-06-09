return {
  "catppuccin/nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
