return {
  'catppuccin/nvim',
  -- priority = 1000,
  -- lazy = false,
  opts = {},
  config = function ()
    vim.cmd.colorscheme('catppuccin-mocha')
  end
}
