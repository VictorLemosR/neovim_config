return {
    {"catppuccin/nvim", name = "catppuccin-mocha", priority = 1000, lazy = true},
    {"sainnhe/everforest", name = "everforest", priority = 1000, lazy = true,
    config = function()
        vim.g.everforest_background = 'hard'
        vim.cmd('colorscheme everforest')
    end
},
    { 'rose-pine/neovim', name = 'rose-pine', priority = 1000, lazy = false,
      config = function()
        vim.cmd('colorscheme rose-pine-moon')
      end
    },
    {"EdenEast/nightfox.nvim", priority = 1000, lazy = true,
    config = function()
        -- check for other colors, they are all good
        vim.cmd('colorscheme duskfox')
    end
},
    {"folke/tokyonight.nvim", priority = 1000, lazy = true,
    config = function()
        vim.cmd('colorscheme tokyonight-moon')
    end
}
}
