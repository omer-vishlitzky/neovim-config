---@diagnostic disable: missing-fields
return {
  "folke/tokyonight.nvim",
  ---@module "tokyonight"
  ---@type tokyonight.Config
  opts = {
    ---@param colors ColorScheme
    on_colors = function(colors)
      colors.bg = "#111111"
    end,
  },
  priority = 1000,
}
