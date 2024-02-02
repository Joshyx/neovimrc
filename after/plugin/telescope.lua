local builtin = require('telescope.builtin')

require("telescope").load_extension("refactoring")

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = "Search [Git] [F]iles" })
vim.keymap.set('n', '<leader>ss', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "[S]earch for [S]tring" })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = "[S]earch [C]olorschemes" })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = "[S]how [D]iagnostics" })
