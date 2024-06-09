return {
  "projekt0n/github-nvim-theme",
  priority = 1000,
  config = function()
    local cfg = {
      options = {
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = true,
          search = true,
        },
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    }
    require("github-theme").setup(cfg)
  end,
}
