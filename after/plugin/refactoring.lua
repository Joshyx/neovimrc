require('refactoring').setup({
    -- prompt for return type
    prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
    },
    show_success_message = true,
})

vim.keymap.set(
    { "n", "x" },
    "<leader>rs",
    function() require('telescope').extensions.refactoring.refactors() end,
    { desc = "[S]earch Refactoring Options" }
)
vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function') end,
    { desc = "Extract [f]unction" })
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end,
    { desc = "Extract [v]ariable" })
vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end,
    { desc = "Extract [b]lock" })
vim.keymap.set("n", "<leader>rF", function() require('refactoring').refactor('Inline Function') end,
    { desc = "Inline [F]unction" })
vim.keymap.set({ "n", "x" }, "<leader>rV", function() require('refactoring').refactor('Inline Variable') end,
    { desc = "Inline [V]ariable" })
