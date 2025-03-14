return {
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/playground' },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
--    config = function ()
--        require'nvim-treesitter.configs'.setup {
--            ensure_installed = { "python", "lua", "query", "rust"},
--
--            -- Install parsers synchronously (only applied to `ensure_installed`)
--            sync_install = true,
--
--            -- Automatically install missing parsers when entering buffer
--            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--            auto_install = true,
--
--            highlight = {
--                enable = true,
--                additional_vim_regex_highlighting = false,
--            },
--        }
--
--    end,
}
