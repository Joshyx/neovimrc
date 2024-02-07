local builtin = require('telescope.builtin')

require("telescope").load_extension("refactoring")
require("telescope").load_extension("notify")
require("telescope").load_extension("conflicts")

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>sgf', builtin.git_files, { desc = "Search [Git] [F]iles" })
vim.keymap.set('n', '<leader>ss', function()
    local search = vim.fn.input("Search String > ")
    if search.len(search) ~= 0 then
        builtin.grep_string({ search = search });
    end
end, { desc = "[S]earch for [S]tring" })
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
