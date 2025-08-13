return {
    { "catppuccin/nvim", name = "catppuccin-mocha", priority = 1000, lazy = true },
    {
        "sainnhe/everforest",
        name = "everforest",
        priority = 1000,
        lazy = true,
        config = function()
            vim.g.everforest_background = "hard"
            vim.cmd("colorscheme everforest")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        lazy = true,
        config = function()
            vim.cmd("colorscheme rose-pine-moon")
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = true,
        config = function()
            -- check for other colors, they are all good
            vim.cmd("colorscheme nightfox")
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = true,
        config = function()
            vim.cmd("colorscheme tokyonight-moon")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = true,
        config = function()
            vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "sainnhe/sonokai",
        priority = 1000,
        lazy = false,
        config = function()
            -- check for other colors, they are all good
            vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_better_performance = 1
--            vim.g.sonokai_dim_inactive_windows = 1
            vim.g.sonokai_colors_override = {
                yellow = { "#d5b359", "107" },
            }
            vim.cmd("colorscheme sonokai")
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        lazy = true,
        config = function()
            --vim.cmd('colorscheme kanagawa-wave')
            vim.cmd("colorscheme kanagawa-dragon")
            --vim.cmd('colorscheme kanagawa-lotus')
        end,
    },
}
