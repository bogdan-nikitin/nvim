-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'bkad/CamelCaseMotion'
    use { 'michaelb/sniprun', run = 'sh ./install.sh 1'}

    -- Coloscheme
    use 'tanvirtin/monokai.nvim'

    -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- use "folke/trouble.nvim" -- bugs with quickfix
    -- use { -- only signs and balloons (which doesn't work)
    --     'LucHermitte/vim-compil-hints',
    --     requires = { {'LucHermitte/lh-vim-lib'} }
    -- }
    use 'maxmx03/fluoromachine.nvim'
    use 'navarasu/onedark.nvim'
    use 'nvim-tree/nvim-web-devicons'

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    --use 'm4xshen/autoclose.nvim' -- poor defaults
    use 'jiangmiao/auto-pairs'
end)

