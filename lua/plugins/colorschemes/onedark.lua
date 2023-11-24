return {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    lazy = true,
    config = function()
        require('onedark').setup({})
    end,
}
