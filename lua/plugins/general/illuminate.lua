return {
  "RRethy/vim-illuminate",
  -- event = { "BufReadPost", "BufNewFile" },
  event = { "VeryLazy" },
  config = function()
    -- default configuration
    require("illuminate").configure({}) -- change the highlight styl

    --- @type vim.api.keyset.highlight
    local val = {
      background = "#424242",
    }
    vim.api.nvim_set_hl(0, "IlluminatedWordText", val)
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", val)
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", val)
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      pattern = { "*" },
      callback = function()
        vim.api.nvim_set_hl(0, "IlluminatedWordText", val)
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", val)
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", val)
      end,
    })
  end,
}
