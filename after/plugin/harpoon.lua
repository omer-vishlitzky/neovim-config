vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')



vim.keymap.set('n', '<leader>ht', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', {noremap = true, silent = true, desc = "HarpoonToggle"})
vim.keymap.set('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', {noremap = true, silent = true, desc = "HarpoonAddFile"})
vim.keymap.set('n', '<C-]>', '<cmd>lua require("harpoon.ui").nav_next()<CR>', {noremap = true, silent = true, desc = "HarpoonNext"})
vim.keymap.set('n', '<C-[>', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', {noremap = true, silent = true, desc = "HarpoonPrev"})



global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = true,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
}


function _G.add_quickfix_to_harpoon()
  local qf_list = vim.fn.getqflist()
  for _, item in ipairs(qf_list) do
    local filename = vim.fn.bufname(item.bufnr)
    require("harpoon.mark").add_file(filename)
  end
end

-- Map the command
vim.cmd('command! -nargs=? HarpoonAddQuickfix lua add_quickfix_to_harpoon()')
