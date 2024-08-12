return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    opts = {
        -- A list of parser names, or "all" (the four listed parsers should always be installed)
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'python' },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
