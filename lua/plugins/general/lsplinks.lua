return {
  "icholy/lsplinks.nvim",
  ft = { "yaml" },
  config = function()
    local lsplinks = require("lsplinks")
    lsplinks.setup()
    vim.keymap.set("n", "gx", lsplinks.gx)
  end
}
