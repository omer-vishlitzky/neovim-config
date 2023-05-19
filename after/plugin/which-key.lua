local mappings = {
  f = { "Telescope", "Telescope" },
  x = { "TroubleToggle", "TroubleToggle" },
}

require("which-key").register(mappings, { prefix = "<leader>" })
