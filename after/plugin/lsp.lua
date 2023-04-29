local lsp = require('lsp-zero').preset({})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'bashls',
  'jdtls',
  'lua_ls',
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, desc = "go defition"})
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, desc = "hover"})
end)

lsp.setup_servers({'dartls', force = true})


lsp.setup()




