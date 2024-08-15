return{
    "windwp/nvim-autopairs",

    config = function ()
        require("nvim-autopairs").setup {
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            enable_check_bracket_line = true,
        }
    end
}
