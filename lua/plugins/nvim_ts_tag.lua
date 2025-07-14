--Autoclose and rename tags in html (works for leptos and .ts)
return {
    "windwp/nvim-ts-autotag",
    config = function()
        require("nvim-ts-autotag").setup()
    end,
}
