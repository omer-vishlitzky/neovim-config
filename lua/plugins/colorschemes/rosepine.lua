---@diagnostic disable: missing-fields
return {
  "rose-pine/neovim",
  priority = 1000,
  name = "rose-pine",
  -- lazy = false,
  config = function()
    ---@type Options
    local cfg = {
      ---@usage 'auto'|'main'|'moon'|'dawn'
      variant = "auto",
      ---@usage 'main'|'moon'|'dawn'
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = true,
      disable_float_background = false,
      disable_italics = false,

      dim_inactive_windows = true,
      groups = {
        background = "#111111",
        panel = "surface",
        panel_nc = "base",
        border = "highlight_med",
        comment = "muted",
        link = "iris",
        punctuation = "subtle",

        error = "love",
        hint = "iris",
        info = "foam",
        warn = "gold",

        headings = {
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
      },
    }
    require("rose-pine").setup(cfg)
  end,
}
