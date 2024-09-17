return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        require("nvim-tree").setup()
        local keymap = vim.keymap
        local api = require'nvim-tree.api'

        keymap.set("n", "<space>et", api.tree.toggle)
        keymap.set("n", "<space>eo", api.tree.focus)
        keymap.set("n", "<space>ef", function() 
            api.tree.toggle({find_file = true})
        end)
    end,
}
