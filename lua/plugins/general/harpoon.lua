return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>ha", mode = { "n" }, desc = "[H]arpoon [A]" },
    { "H", mode = { "n" } , desc = "[H]arpoon"},
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "[H]arpoon [A]dd" })
    vim.keymap.set("n", "H", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon menu" })
    require("harpoon"):extend(require("harpoon.extensions").builtins.command_on_nav('UfoEnableFold'))
  end,
}
