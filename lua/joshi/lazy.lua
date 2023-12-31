local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'rose-pine/neovim', name = 'rose-pine'},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {'ThePrimeagen/harpoon'},
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'windwp/nvim-autopairs', opts = {}, event = 'InsertEnter'},
    {'nvim-lualine/lualine.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-tree/nvim-tree.lua'},
    {
        "NvChad/nvterm",
        config = function ()
            require("nvterm").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        config = function ()
            require("trouble").setup()
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup()
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    {'ThePrimeagen/vim-be-good'},
    {'tpope/vim-surround'},
    {'prichrd/netrw.nvim'},
    {'tpope/vim-commentary'},
    {'justinmk/vim-sneak'},
    {'vim-test/vim-test'},
})
