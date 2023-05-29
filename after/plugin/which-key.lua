local mappings = {
  f = { "Telescope", "Telescope" },
  x = { "TroubleToggle", "TroubleToggle" },
  h = { "Harpoon", "Harpoon" },
  r = { "Refactoring", "Refactoring" },
}

require("which-key").register(mappings, { prefix = "<leader>" })
