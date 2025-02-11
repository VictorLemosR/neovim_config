--Buscar inspiração em iron.nvim pra mandar do python pro terminal
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- size can be a number or function which is passed the current terminal
            size = 50,
            --function(term)
            --    if term.direction == "vertical" then
            --        return 20
            --    end
            --end,
            open_mapping = [[<C-t>asrt]],
            hide_numbers = false,
            direction = "vertical", -- | 'horizontal' | 'tab' | 'float',
            start_in_insert = false,
            insert_mappings = false,
        })
    end,
}
