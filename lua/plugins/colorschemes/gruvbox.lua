return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    ---@diagnostic disable-next-line: undefined-doc-name
    --- @type GruvboxConfig
    local cfg = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
        emphasis = true
      },
      strikethrough = true,
      invert_selection = true,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,    -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {
      },
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
      terminal_colors = true,
    }
    require("gruvbox").setup(cfg)
    vim.cmd.colorscheme 'gruvbox'
  end
}
