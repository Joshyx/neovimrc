local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', 'zh', function()
        api.tree.toggle_hidden_filter()
        api.tree.toggle_gitignore_filter()
    end)
end

require("nvim-tree").setup({
    sort = {
        sorter = "name",
    },
    ui = {
        confirm = {
            default_yes = true,
        }
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    diagnostics = {
        enable = true,
    },
    modified = {
        enable = true,
    },
    filters = {
        dotfiles = true,
        git_ignored = true,
    },
    on_attach = my_on_attach,
    update_focused_file = {
        enable = true,
    }
})

vim.keymap.set("n", "<leader>sf", vim.cmd.NvimTreeFindFile)
