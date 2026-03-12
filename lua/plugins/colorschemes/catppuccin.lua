return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    ---@type CatppuccinOptions
    local opts = {
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        blink_cmp = true,
        dap = true,
        dap_ui = true,
        which_key = true,
        diffview = true,
        fidget = true,
        fzf = true,
        harpoon = true,
        mason = true,
        neotest = true,
      },
      no_bold = false,
      no_italic = false,
      no_underline = false,
      flavour = "mocha",
      background = {
        dark = "mocha",
      },
      color_overrides = {
        mocha = {
          -- base = "#111111"
        }
      }
    }
    require("catppuccin").setup(opts)
    -- vim.cmd.colorscheme("catppuccin")
  end,
}
