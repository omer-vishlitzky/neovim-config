return {
  "catppuccin/nvim",
  priority = 1000,
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
  end,
}
