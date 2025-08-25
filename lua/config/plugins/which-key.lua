return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      local tsbuiltin = require("telescope.builtin")
      wk.add({
        -- mode = { "n", "v" },
        -- noremap = true,
        -- silent = true,
        -- Basics

        ---- Delete without yanking
        --				{ "<leader>d", '"_d', desc = "Delete without yanking" },
        ---- Move lines up/down
        { "<A-j>",      ":m .+1<CR>==",            desc = "Move line down" },
        { "<A-k>",      ":m .-2<CR>==",            desc = "Move line up" },
        { "<A-j>",      ":m '>+1<CR>gv=gv",        desc = "Move selection down" },
        { "<A-k>",      ":m '<-2<CR>gv=gv",        desc = "Move selection up" },
        ---- Better indenting in visual mode
        { "<",          "<gv",                     { desc = "Indent left and reselect" } },
        { ">",          ">gv",                     { desc = "Indent right and reselect" } },

        -- Buffers
        { "<leader>b",  group = "Buffers" },
        { "<leader>bn", "<cmd>bnext<cr>",          desc = "Next buffer" },
        { "<leader>bN", "<cmd>bprevious<cr>",      desc = "Previous buffer" },
        { "<leader>bd", "<cmd>bd<cr>",             desc = "Delete buffer" },
        { "<leader>bl", "<cmd>buffers<cr>",        desc = "List buffers" },
        -- Windows
        ---- Window navigation
        { "<C-h>",      "<C-w>h",                  desc = "Move to left window" },
        { "<C-j>",      "<C-w>j",                  desc = "Move to bottom window" },
        { "<C-k>",      "<C-w>k",                  desc = "Move to top window" },
        { "<C-l>",      "<C-w>l",                  desc = "Move to right window" },
        { "<C-Up>",     ":resize +2<CR>",          desc = "Increase window height" },
        { "<C-Down>",   ":resize -2<CR>",          desc = "Decrease window height" },
        { "<C-Left>",   ":vertical resize -2<CR>", desc = "Decrease window width" },
        { "<C-Right>",  ":vertical resize +2<CR>", desc = "Increase window width" },
        { "<leader>w",  group = "Windows" },
        { "<leader>wv", "<cmd>vsplit<CR>",         desc = "Split window vertically" },
        { "<leader>ws", "<cmd>split<CR>",          desc = "Split window horizontally" },
        { "<leader>w=", "<cmd>wincmd =<CR>",       desc = "Equal size windows" },
        { "<leader>wc", "<cmd>close<CR>",          desc = "Close the current window" },
        { "<leader>wo", "<cmd>only<CR>",           desc = "Close the other windows" },
        { "<leader>wh", "<C-w>h",                  desc = "Jump to left window" },
        { "<leader>wj", "<C-w>j",                  desc = "Jump to down window" },
        { "<leader>wk", "<C-w>k",                  desc = "Jump to up window" },
        { "<leader>wl", "<C-w>l",                  desc = "Jump to right window" },
        -- Telescope
        { "<leader>f",  group = "Find" },
        { "<leader>ff", tsbuiltin.find_files,      desc = "[F]ind [F]iles" },
        { "<leader>fg", tsbuiltin.live_grep,       desc = "[F]ind by [G]rep" },
        { "<leader>fw", tsbuiltin.grep_string,     desc = "[F]ind current [W]ord" },
        { "<leader>fd", tsbuiltin.diagnostics,     desc = "[F]ind [D]iagnostics" },
        { "<leader>fk", tsbuiltin.keymaps,         desc = "[F]ind [K]eymaps" },
        {
          "<leader>fb",
          function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
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
          desc = "[F]ind in Open Files",
        },
        -- Lsp settings
        { "<leader>g", group = "Goto" },
      })
    end,

    --
    --        { '<leader>d', group = 'Diagnostics' },
    --        { '<leader>dc', desc = 'Open diagnostic float' },
    --        { '<leader>d]', desc = 'Next diagnostic' },
    --        { '<leader>d[', desc = 'Previous diagnostic' },
    --        { '<leader>da', desc = 'Set location list' },
    --
    --         { "<leader>g",  group = "[G]oto (LSP)" },
    --         { "<leader>gd", desc = "Goto Definition" },
    --         { "<leader>gD", desc = "Goto Declaration" },
    --         { "<leader>gr", desc = "Goto References" },
    --         { "<leader>gI", desc = "Goto Implementation" },
    --         { "<leader>gT", desc = "Type Definition" },
    --         { "<leader>gs", desc = "Document Symbols" },
    --         { "<leader>gS", desc = "Workspace Symbols" },
  },
}
