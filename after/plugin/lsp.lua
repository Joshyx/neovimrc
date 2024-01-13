local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>crr", vim.lsp.buf.references)
    vim.keymap.set("n", "<leader>crn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>cw", vim.lsp.buf.workspace_symbol)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
end)

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "bashls", "lua_ls", "rust_analyzer", "kotlin_language_server", "jdtls", "tsserver" },
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'lsp_zero' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
