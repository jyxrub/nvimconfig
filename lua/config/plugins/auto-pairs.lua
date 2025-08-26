return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {
        map = "<C-e>", -- use Ctrl+E instead of Alt+E
      },
    },
    --    config = function(_, opts)
    --      require("nvim-autopairs").setup(opts)
    --
    --      -- OPTIONAL: integrate with nvim-cmp
    --      local ok_cmp, cmp = pcall(require, "cmp")
    --      if ok_cmp then
    --        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    --        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    --      end
    --    end,
  },
}
