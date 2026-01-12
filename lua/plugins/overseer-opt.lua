return {
    'stevearc/overseer.nvim',
    opts = {},
    dependencies = {"mfussenegger/nvim-dap"}, -- should be loaded before
    config = function() 
        vim.keymap.set('n', '<leader>or', ':OverseerRun<CR>')
        require("overseer").setup({
            templates = { 
                "builtin", 
                "user.cpp_adv_build", 
                "user.cmake_build", 
                "user.cmake_ninja" },
        }) 
    end
}
