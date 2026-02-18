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
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true
                },
            }
            require('telescope').load_extension('projects')
        end
    },
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     config = function()
    --         require('lualine').setup()
    --     end
    -- },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ['rust-analyzer'] = {
                            diagnostics = {
                                experimental = {
                                    enable = true,
                                },
                            },
                        },
                    },
                },
            }
        end
    },
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^4', -- Recommended
        lazy = false, -- This plugin is already lazy
        confing = function()
            -- vim.g.haskell_tools = {
            --     hls = {
            --         filetypes = { 'haskell', 'lhaskell', 'cabal' },
            --         settings = {
            --             haskell = {
            --                 cabalFormattingProvider = "cabalfmt",
            --                 formattingProvider = "stylish-haskell"
            --             }
            --         }
            --     },
            -- }
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup()
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
    {
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup {
                lsp_cfg = true,
                luasnip = true,
                lsp_keymaps = false
            }
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        cond = function()
            return vim.fn.executable("go") == 1
        end,
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
}

