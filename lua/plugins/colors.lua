return {
    {"catppuccin/nvim", name = "catppuccin", lazy = true},
    { 'rose-pine/neovim', name = 'rose-pine', lazy = false,
      config = function()
        vim.cmd('colorscheme rose-pine-moon')
      end
    },
}
