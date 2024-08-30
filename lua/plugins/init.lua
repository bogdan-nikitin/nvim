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
    {
        'kana/vim-textobj-entire',
        dependencies = {'kana/vim-textobj-user'}
    },

    -- Colorscheme
     {
        'navarasu/onedark.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            -- require('monokai').setup {}
            require('onedark').load()
        end,
    },
    -- "folke/trouble.nvim" -- bugs with quickfix
    -- { -- only signs and balloons (which doesn't work)
    --     'LucHermitte/vim-compil-hints',
    --     requires = { {'LucHermitte/lh-vim-lib'} }
    -- }
    
    -- Other colorschemes
    'tanvirtin/monokai.nvim',
    -- 'maxmx03/fluoromachine.nvim'
    -- 'navarasu/onedark.nvim',
    -- 'nvim-tree/nvim-web-devicons'

    -- Auto pairs
    -- "Raimondi/delimitMate",
    --'m4xshen/autoclose.nvim' -- poor defaults
    -- 'jiangmiao/auto-pairs'

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown {
                    -- even more opts
                  }

                  -- pseudo code / specification for writing custom displays, like the one
                  -- for "codeactions"
                  -- specific_opts = {
                  --   [kind] = {
                  --     make_indexed = function(items) -> indexed_items, width,
                  --     make_displayer = function(widths) -> displayer
                  --     make_display = function(displayer) -> function(e)
                  --     make_ordinal = function(e) -> string
                  --   },
                  --   -- for example to disable the custom builtin "codeactions" display
                  --      do the following
                  --   codeactions = false,
                  -- }
                }
              }
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn", -- set to `false` to disable one of the mappings
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            }
        end
    },
    {
        'RRethy/nvim-treesitter-textsubjects',
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        config = function()
            require('nvim-treesitter.configs').setup {
                textsubjects = {
                    enable = true,
                    prev_selection = ',', -- (Optional) keymap to select the previous selection
                    keymaps = {
                        ['.'] = 'textsubjects-smart',
                        [';'] = 'textsubjects-container-outer',
                        ['i;'] = 'textsubjects-container-inner',
                        ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
                    },
                },
            }
        end
    },
}

