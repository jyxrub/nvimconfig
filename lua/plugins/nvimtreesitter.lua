return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    event = "VeryLazy",
    opts = {
        ensure_installed = {
            { "lua", "python", "cpp", "c", "fortran", "gnuplot" }
        },
        highlight = { enable = true }
    },
}

