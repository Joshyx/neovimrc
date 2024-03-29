local lsp_zero = require('lsp-zero')
require("lsp-format").setup {
    rust = {
        exclude = { "rust_analyzer" }
    },
}

lsp_zero.on_attach(function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)

    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show [C]ode [A]ctions" })
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[R]ename symbol" })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[F]ormat" })
    vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[C]ode [D]iagnostics" })
    vim.keymap.set("n", "<leader>ci", function()
        vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
        })
    end, { desc = "[C]ode organize [i]mports" })

    vim.keymap.set('n', 'gd', require("telescope.builtin").lsp_definitions, { desc = "[G]o to [D]efinition(s)" })
    vim.keymap.set('n', 'gt', require("telescope.builtin").lsp_type_definitions, { desc = "[G]o to [T]ype(s)" })
    vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, { desc = "[S]earch [R]eferences" })
    vim.keymap.set('n', 'gI', require("telescope.builtin").lsp_implementations, { desc = "[S]earch [I]mplementations" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next [D]iagnostic" })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous [D]iagnostic" })

    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature [H]elp" })

    require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    }
end)

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
        }
    end,
}

lsp_zero.new_client({
    name = 'kolsp',
    cmd = { '/home/joshi/programming/rust/kolsp/target/debug/kolsp' },
    filetypes = { 'kol' },
    root_dir = function()
        return lsp_zero.dir.find_first({ '.kol' })
    end
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup {}

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'lsp_zero' },
        -- { name = 'luasnip' }
    },
    formatting = lsp_zero.cmp_format(),
    -- snippet = {
    --     expand = function(args)
    --         luasnip.lsp_expand(args.body)
    --     end
    -- },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping(function(_)
            vim.api.nvim_feedkeys(
                vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
        end)
    }),
})
