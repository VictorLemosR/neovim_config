return {
    --Show the most recent version of crates in a config.toml
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
        require('crates').setup()
    end,
}
