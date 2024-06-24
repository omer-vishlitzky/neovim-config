return {
  "icholy/lsplinks.nvim",
  lazy = false,
  config = function()
    local lsplinks = require("lsplinks")
    lsplinks.setup()
    vim.keymap.set("n", "gx", lsplinks.gx)
  end
}
