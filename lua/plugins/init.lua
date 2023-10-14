return {
    {
        'williamboman/mason-lspconfig.nvim',   
        lazy = false,
        dependencies = {"williamboman/mason.nvim"},
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    'bkad/CamelCaseMotion',

    -- Coloscheme
     {
        'tanvirtin/monokai.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require('monokai').setup {}
        end,
    },
    -- "folke/trouble.nvim" -- bugs with quickfix
    -- { -- only signs and balloons (which doesn't work)
    --     'LucHermitte/vim-compil-hints',
    --     requires = { {'LucHermitte/lh-vim-lib'} }
    -- }
    
    -- Other colorschemes
    -- 'maxmx03/fluoromachine.nvim'
    -- 'navarasu/onedark.nvim'
    -- 'nvim-tree/nvim-web-devicons'

    -- "Raimondi/delimitMate",
    --'m4xshen/autoclose.nvim' -- poor defaults
    -- 'jiangmiao/auto-pairs'

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
}

