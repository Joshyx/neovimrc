require("gitsigns").setup {
    -- See `:help gitsigns.txt`
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- normal mode
        map('n', '<leader>gr', gs.reset_hunk, { desc = '[G]it [r]eset hunk' })
        map('n', '<leader>gB', function()
            gs.blame_line { full = false }
        end, { desc = '[G]it [B]lame line' })

        -- Toggles
        map('n', '<leader>gt', gs.toggle_deleted, { desc = '[T]oggle [G]it show deleted' })

        require("which-key").register {
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        }
    end,
}
