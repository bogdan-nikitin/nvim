return {
    -- Auto pairs
    -- "Raimondi/delimitMate",
    --'m4xshen/autoclose.nvim' -- poor defaults
    -- 'jiangmiao/auto-pairs'

    -- 'LunarWatcher/auto-pairs',
    -- config = function()
    --     vim.cmd('let g:AutoPairsMapBS=1')
    --     vim.cmd('let g:AutoPairsSingleQuoteMode=0')
    -- end
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
