return {
    "tamton-aquib/duck.nvim",
    config = function()
        vim.keymap.set("n", "<leader>duck1", function()
            require("duck").hatch()
        end, {})
        vim.keymap.set("n", "<leader>duck2", function()
            require("duck").hatch("🦀", 0.75)
        end, {}) -- Quite a mellow cat
        vim.keymap.set("n", "<leader>duck3", function()
            require("duck").hatch("🦖", 5)
        end, {}) -- Quite a mellow cat
        vim.keymap.set("n", "<leader>duckd", function()
            require("duck").cook_all()
        end, {})
    end,
}
