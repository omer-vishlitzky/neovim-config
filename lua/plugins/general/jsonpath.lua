return {
  'phelipetls/jsonpath.nvim',
  keys = {
    { "<leader>jw", mode = { "n" }, desc = "[J]son Show in [W]inbar" },
    { "<leader>jc", mode = { "n" }, desc = "[J]son [C]opy" }
  },
  config = function()
    vim.keymap.set("n", "<leader>jw", function()
      if vim.fn.exists("+winbar") == 1 then
        vim.opt_local.winbar = "%{%v:lua.require'jsonpath'.get()%}"
      end
    end, { desc = "[J]son [P]ath" })

    vim.keymap.set("n", "<leader>jc", function()
      vim.fn.setreg("+", require("jsonpath").get())
    end, { desc = "[J]son [P]ath" })
  end
}
