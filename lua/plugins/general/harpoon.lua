return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>a", mode = { "n" } },
    { "H", mode = { "n" } },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "[H]arpoon [A]dd" })
    vim.keymap.set("n", "H", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}
