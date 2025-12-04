return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- PERFORMANCE: Configure timeouts
      delay = 500, -- Matches vim.opt.timeoutlen
      preset = "modern",
      icons = {
        mappings = vim.g.have_nerd_font ~= false,
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      local tsbuiltin = require("telescope.builtin")

      wk.add({
        -- Basic editing
        { "<leader>d",  '"_d',                     desc = "Delete without yanking",    mode = { "n", "v" } },

        -- Move lines (keep Alt bindings for convenience)
        { "<A-j>",      ":m .+1<CR>==",            desc = "Move line down",            mode = "n" },
        { "<A-k>",      ":m .-2<CR>==",            desc = "Move line up",              mode = "n" },
        { "<A-j>",      ":m '>+1<CR>gv=gv",        desc = "Move selection down",       mode = "v" },
        { "<A-k>",      ":m '<-2<CR>gv=gv",        desc = "Move selection up",         mode = "v" },

        -- Visual mode indenting
        { "<",          "<gv",                     desc = "Indent left and reselect",  mode = "v" },
        { ">",          ">gv",                     desc = "Indent right and reselect", mode = "v" },

        -- Buffers
        { "<leader>b",  group = "Buffers" },
        { "<leader>bn", "<cmd>bnext<cr>",          desc = "Next buffer" },
        { "<leader>bN", "<cmd>bprevious<cr>",      desc = "Previous buffer" },
        { "<leader>bd", "<cmd>bd<cr>",             desc = "Delete buffer" },
        { "<leader>bl", "<cmd>buffers<cr>",        desc = "List buffers" },
        { "<leader>bo", "<cmd>%bd|e#<cr>",         desc = "Delete all other buffers" },
        { "<leader>bO", "<cmd>%bd<cr>",            desc = "Delete all buffers" },

        -- Windows
        { "<leader>w",  group = "Windows" },
        { "<leader>wv", "<cmd>vsplit<CR>",         desc = "Split window vertically" },
        { "<leader>ws", "<cmd>split<CR>",          desc = "Split window horizontally" },
        { "<leader>w=", "<cmd>wincmd =<CR>",       desc = "Equal size windows" },
        { "<leader>wc", "<cmd>close<CR>",          desc = "Close current window" },
        { "<leader>wo", "<cmd>only<CR>",           desc = "Close other windows" },
        { "<leader>wh", "<C-w>h",                  desc = "Jump to left window" },
        { "<leader>wj", "<C-w>j",                  desc = "Jump to down window" },
        { "<leader>wk", "<C-w>k",                  desc = "Jump to up window" },
        { "<leader>wl", "<C-w>l",                  desc = "Jump to right window" },

        -- Quick window navigation (keep Ctrl for convenience)
        { "<C-h>",      "<C-w>h",                  desc = "Move to left window" },
        { "<C-j>",      "<C-w>j",                  desc = "Move to bottom window" },
        { "<C-k>",      "<C-w>k",                  desc = "Move to top window" },
        { "<C-l>",      "<C-w>l",                  desc = "Move to right window" },

        -- Window resizing (keep Ctrl-arrows)
        { "<C-Up>",     ":resize +2<CR>",          desc = "Increase window height" },
        { "<C-Down>",   ":resize -2<CR>",          desc = "Decrease window height" },
        { "<C-Left>",   ":vertical resize -2<CR>", desc = "Decrease window width" },
        { "<C-Right>",  ":vertical resize +2<CR>", desc = "Increase window width" },

        -- Telescope
        { "<leader>f",  group = "Find" },
        { "<leader>ff", tsbuiltin.find_files,      desc = "Find files" },
        { "<leader>fg", tsbuiltin.live_grep,       desc = "Find by grep" },
        { "<leader>fw", tsbuiltin.grep_string,     desc = "Find current word" },
        { "<leader>fd", tsbuiltin.diagnostics,     desc = "Find diagnostics" },
        { "<leader>fk", tsbuiltin.keymaps,         desc = "Find keymaps" },
        { "<leader>fr", tsbuiltin.oldfiles,        desc = "Find recent files" },
        { "<leader>f.", tsbuiltin.resume,          desc = "Resume last search" },
        { "<leader>fc", tsbuiltin.commands,        desc = "Find commands" },
        { "<leader>fh", tsbuiltin.help_tags,       desc = "Find help" },
        {
          "<leader>fb",
          function()
            tsbuiltin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
            }))
          end,
          desc = "Fuzzily find in current buffer",
        },
        {
          "<leader>f/",
          function()
            tsbuiltin.live_grep({
              grep_open_files = true,
              prompt_title = "Live Grep in Open Files",
            })
          end,
          desc = "Find in open files",
        },

        -- LSP Goto group (populated by lsp.lua)
        { "<leader>g",  group = "Goto" },

        -- Folding operations (all under <leader>z)
        { "<leader>z",  group = "Folding" },
        { "<leader>za", "za",             desc = "Toggle fold" },
        { "<leader>zA", "zA",             desc = "Toggle fold recursively" },
        { "<leader>zo", "zo",             desc = "Open fold" },
        { "<leader>zO", "zO",             desc = "Open fold recursively" },
        { "<leader>zc", "zc",             desc = "Close fold" },
        { "<leader>zC", "zC",             desc = "Close fold recursively" },
        { "<leader>zR", "zR",             desc = "Open all folds" },
        { "<leader>zM", "zM",             desc = "Close all folds" },
        { "<leader>zr", "zr",             desc = "Reduce folding" },
        { "<leader>zm", "zm",             desc = "More folding" },
        { "<leader>zv", "zv",             desc = "View cursor line" },
        { "<leader>zx", "zx",             desc = "Update folds" },
        { "<leader>zj", "zj",             desc = "Next fold" },
        { "<leader>zk", "zk",             desc = "Previous fold" },
        { "<leader>z[", "[z",             desc = "Start of fold" },
        { "<leader>z]", "]z",             desc = "End of fold" },
      })
    end,
  },
}
