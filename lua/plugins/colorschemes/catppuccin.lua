return {
  "catppuccin/nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      ---@type CatppuccinOptions
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
      },
      background = {
        dark = "mocha",
      },
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
