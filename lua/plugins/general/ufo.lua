return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "VeryLazy",
  config = function()
    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Basic UFO keymaps
    local ufo = require("ufo")
    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)
    vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds)
    vim.keymap.set("n", "zp", ufo.peekFoldedLinesUnderCursor)

    -- Custom keymaps for folding to specific levels
    for i = 0, 9 do
      -- Use z1, z2, z3, etc. to fold to that level
      vim.keymap.set("n", "z" .. i, function()
        -- First close all folds
        ufo.closeAllFolds()
        -- Then set the fold level to show the desired level
        vim.o.foldlevel = i
      end, { desc = "Fold to level " .. i })
    end

    -- Setup UFO
    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    })
  end,
}
