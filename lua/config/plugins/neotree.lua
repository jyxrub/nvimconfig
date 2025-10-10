return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })

      vim.keymap.set("n", "<leader>e", function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end, {
        desc = "Toggle Neo-tree",
        silent = true,
        noremap = true,
      })
    end,
    lazy = false, -- neo-tree will lazily load itself
  },
}
