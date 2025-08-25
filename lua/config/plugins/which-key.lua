return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.add({
        --        { '<leader>b', group = 'Buffers' },
        --        { '<leader>bb', desc = 'New buffer' },
        --        { '<leader>bd', desc = 'Delete buffer' },
        --        { '<leader>bN', desc = 'Previous buffer' },
        --        { '<leader>bn', desc = 'Next buffer' },
        --        { '<leader>bl', desc = 'List buffers' },
        --        { '<leader>bf', desc = 'Telescope buffers' },
        --        { '<leader>br', desc = 'Rename buffer' },

        --        { '<leader>c', group = 'Code' },
        --        { '<leader>ca', desc = '[C]ode action' },
        --
        --        { '<leader>w', group = 'Windows' },
        --        { '<leader>ws', desc = 'Split horizontally' },
        --        { '<leader>wv', desc = 'Split vertically' },
        --        { '<leader>wc', desc = 'Close window' },
        --        { '<leader>wo', desc = 'Only window' },
        --        { '<leader>wh', desc = 'Jump left window' },
        --        { '<leader>wj', desc = 'Jump down window' },
        --        { '<leader>wk', desc = 'Jump up window' },
        --        { '<leader>wl', desc = 'Jump right window' },
        --        { '<leader>w=', desc = 'Equalize window sizes' },
        --        { '<leader>w<Up>', desc = 'Resize up' },
        --        { '<leader>w<Down>', desc = 'Resize down' },
        --        { '<leader>w<Left>', desc = 'Resize left' },
        --        { '<leader>w<Right>', desc = 'Resize right' },
        --
        --        { '<leader>l', group = 'Toggle' },
        --        { '<leader>lw', desc = 'Toggle line wrap' },
        --
        --        { '<leader>d', group = 'Diagnostics' },
        --        { '<leader>dc', desc = 'Open diagnostic float' },
        --        { '<leader>d]', desc = 'Next diagnostic' },
        --        { '<leader>d[', desc = 'Previous diagnostic' },
        --        { '<leader>da', desc = 'Set location list' },
        --
        --        { '<leader>e', desc = 'Toggle Neotree' },
        --
        --        { '<leader>f', group = '[S]earch / [F]ind (Telescope)' },
        --        { '<leader>ff', desc = 'Search Files' },
        --        { '<leader>f.', desc = 'Search Recent Files (history)' },
        --        { '<leader>fw', desc = 'Search current Word' },
        --        { '<leader>fg', desc = 'Search by Grep' },
        --        { '<leader>fd', desc = 'Search Diagnostics' },
        --        { '<leader>fr', desc = 'Search Resume (last results)' },
        --        { '<leader>fh', desc = 'Search Help Tags' },
        --        { '<leader>fk', desc = 'Search Keymaps' },
        --        { '<leader>fs', desc = 'Search Telescope builtin' },
        --        { '<leader>f/', desc = 'Fuzzily Search in Current Buffer' },
        --        { '<leader>f?', desc = 'Live Grep in Open Files' },

        { "<leader>g",  group = "[G]oto (LSP)" },
        { "<leader>gd", desc = "Goto Definition" },
        { "<leader>gD", desc = "Goto Declaration" },
        { "<leader>gr", desc = "Goto References" },
        { "<leader>gI", desc = "Goto Implementation" },
        { "<leader>gT", desc = "Type Definition" },
        { "<leader>gs", desc = "Document Symbols" },
        { "<leader>gS", desc = "Workspace Symbols" },
      })
    end,
  },
}
