return {
    -- Theme inspired by Atom
    'catppuccin/nvim',
    config = function()
        require('catppuccin').setup({

        })
        vim.cmd.colorscheme('catppuccin')
    end,
}
