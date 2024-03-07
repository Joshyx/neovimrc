local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}
local builtin = require('telescope.builtin')

require("telescope").load_extension("refactoring")
require("telescope").load_extension("notify")
require("telescope").load_extension("conflicts")
require("telescope").load_extension("ui-select")

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "Search [Git] [F]iles" })
vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = "[S]earch for [S]tring" })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set('n', '<leader>sc', function() builtin.colorscheme({ enable_preview = true }) end,
    { desc = "[S]earch [C]olorschemes" })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = "[S]how [D]iagnostics" })
vim.keymap.set('n', '<leader>sn', require("telescope").extensions.notify.notify, { desc = "[S]search [N]otifications" })

vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "[S]how [C]ommits" })
vim.keymap.set('n', '<leader>gv', builtin.git_bcommits, { desc = "[S]how [V]ersions" })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "[S]how [S]tatus" })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "[S]how [B]ranch" })
vim.keymap.set('n', '<leader>gm', ":Telescope conflicts<CR>",
    { desc = "[S]how [M]erge conflicts" })
