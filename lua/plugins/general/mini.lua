return {
  "echasnovski/mini.misc",
  version = false,
  opts = {},
  keys = {
    {
      "<leader>,",
      function()
        require("mini.misc").zoom()
      end,
      desc = "Toggle zoom",
    },
  },
}
