local builtin = require('telescope.builtin')

require("telescope").load_extension("refactoring")
require("telescope").load_extension("notify")

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "Search [Git] [F]iles" })
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
