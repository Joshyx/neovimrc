local builtin = require('telescope.builtin')
require('telescope').load_extension('tmuxinator')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers)
vim.keymap.set('n', '<leader>pc', builtin.colorscheme)
vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>pd', builtin.diagnostics)

vim.keymap.set('n', '<leader>pp', function ()
    require('telescope').extensions.tmuxinator.projects{}
end)
