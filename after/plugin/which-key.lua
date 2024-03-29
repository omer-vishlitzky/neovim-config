local mappings = {
  c = { "Change", "Change" },
  g = { "Gitsigns", "Gitsigns" },
  f = { "Telescope", "Telescope" },
  d = { "DiffView", "DiffView" },
  x = { "TroubleToggle", "TroubleToggle" },
  h = { "Harpoon", "Harpoon" },
  r = { "Refactoring", "Refactoring" },
}

require("which-key").register(mappings, { prefix = "<leader>" })
