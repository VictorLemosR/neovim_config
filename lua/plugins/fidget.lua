-- Plugin to show notifications in bottom right
return {
    'j-hui/fidget.nvim',
    config = function ()
        require('fidget').setup({})
    end
}
