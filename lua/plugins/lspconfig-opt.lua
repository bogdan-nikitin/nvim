return {
    'neovim/nvim-lspconfig',
    config = function()
        -- Setup language servers.
        local builtin = require('telescope.builtin')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.lsp.config('clangd', { 
            cmd = { "clangd", "--completion-style=detailed" }, 
            capabilities = capabilities,
        })
        vim.lsp.enable('clangd')
        vim.lsp.config('pyright', {
            capabilities = capabilities,
        })
        vim.lsp.config('ruby_lsp', {
            init_options = {
                linters = {}
            }
        })
        -- lspconfig.hls.setup{
        --     filetypes = { 'haskell', 'lhaskell', 'cabal' },
        --     settings = {
        --         haskell = {
        --             cabalFormattingProvider = "cabalfmt",
        --             formattingProvider = "stylish-haskell"
        --         }
        --     }
        -- }
        vim.lsp.config('tinymist', {
            -- TODO: Check
            settings = {
                exportPdf = "never" -- Choose onType, onSave or never.
                -- serverPath = "" -- Normally, there is no need to uncomment it.
            }
        })

        -- Use rustaceanvim instead
        -- lspconfig.rust_analyzer.setup {
        --     -- Server-specific settings. See `:help lspconfig-setup`
        --     settings = {
        --         ['rust-analyzer'] = {},
        --     },
        -- }
        --
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>le', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', builtin.diagnostics)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', builtin.lsp_type_definitions, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
                vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, {})
                vim.keymap.set('n', 'gS', builtin.lsp_workspace_symbols, {})
                vim.opt_local.signcolumn = 'yes'
            end,
        })
    end
}
