return {
  "rose-pine/neovim",
  priority = 1000,
  name = "rose-pine",
  -- lazy = false,
  config = function()
    ---@type Options
    local cfg = {
      -- ---@type Palette
      -- palette = {
      --   pine = "#111111"
      -- },
      ---@usage 'auto'|'main'|'moon'|'dawn'
      variant = "auto",
      ---@usage 'main'|'moon'|'dawn'
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,

      --- @usage string hex value or named color from rosepinetheme.com/palette
      groups = {
        background_nc = "#111111",
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
        -- or set all headings at once
        -- headings = 'subtle'
      },

      -- Change specific vim highlight groups
      -- https://github.com/rose-pine/neovim/wiki/Recipes
      ---@type Highlight
      highlight_groups = {
        ColorColumn = { bg = "rose" },
        Normal = { bg = "#111111" },
        NormalNC = { bg = "#111111" },
        -- Blend colours against the "base" background
        CursorLine = { bg = "foam", blend = 10 },
        StatusLine = { fg = "love", bg = "love", blend = 10 },

        -- By default each group adds to the existing config.
        -- If you only want to set what is written in this config exactly,
        -- you can set the inherit option:
        Search = { bg = "gold", inherit = false },
      },
    }
    require("rose-pine").setup(cfg)
    -- vim.cmd.colorscheme("rose-pine")
  end,
}
