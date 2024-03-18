return {
    -- Theme inspired by Atom
    'catppuccin/nvim',
    lazy = true,
    config = function()
        require('catppuccin').setup({})
    end,
}
