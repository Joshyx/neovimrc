require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "kotlin", "java", "javascript", "typescript", "rust" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
                ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
                ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["ia"] = { query = "@parameter.inner", desc = "Select inside argument" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'V', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = 'V',     -- blockwise
            },
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-Space>", -- set to `false` to disable one of the mappings
            node_incremental = "<C-Space>",
            node_decremental = "<BS>",
        },
    },
    autotag = {
        enable = true,
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.kol = {
    install_info = {
        url = "~/programming/javascript/tree-sitter-kol", -- local path or git repo
        files = { "src/parser.c" },                       -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main",                                  -- default branch in case of git repo if different from master
    },
    filetype = "kol",                                     -- if filetype does not match the parser name
}
vim.treesitter.language.register('kol', 'kol')
vim.filetype.add({
    extension = {
        kol = 'kol',
    },
    filename = {
        ['.kol'] = 'kol',
    },
})
