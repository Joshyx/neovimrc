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
        map('n', '<leader>gs', gs.stage_buffer, { desc = '[G]it [S]tage buffer' })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = '[G]it [U]ndo stage' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = '[G]it [r]eset hunk' })
        map('n', '<leader>gR', gs.reset_buffer, { desc = '[G]it [R]eset buffer' })
        map('n', '<leader>gb', function()
            gs.blame_line { full = false }
        end, { desc = '[G]it [B]lame line' })
        map('n', '<leader>gd', gs.diffthis, { desc = '[G]it [d]iff against index' })
        map('n', '<leader>gD', function()
            gs.diffthis '~'
        end, { desc = '[G]it [D]iff against last commit' })
        map('n', '<leader>go', ':Neogit<CR>', { desc = '[G]it [O]verview' })
        map('n', '<leader>gc', ':Neogit<CR>', { desc = '[G]it [C]ommit' })

        -- Toggles
        map('n', '<leader>gt', gs.toggle_deleted, { desc = '[T]oggle [G]it show deleted' })

        require("which-key").register {
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        }
    end,
}
