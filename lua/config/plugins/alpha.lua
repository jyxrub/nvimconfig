return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")
    --    startify.opts.layout = {
    --      { type = 'padding', val = 5 }, -- 顶部空白行，控制垂直位置
    --      startify.section.header,
    --      { type = 'padding', val = 2 },
    --      startify.section.buttons,
    --      { type = 'padding', val = 1 },
    --      startify.section.mru, -- 最近文件列表
    --      { type = 'padding', val = 2 },
    --      startify.section.footer,
    --    }

    -- local dashboard = require 'alpha.themes.dashboard'
    -- local dashboard = require 'alpha.themes.theta'

    startify.section.header.val = {
      [[                                     ]],
      [[      _____________    __  ________  ]],
      [[     /  _/ ____/   |  /  |/  / ___/  ]],
      [[     / // /   / /| | / /|_/ /\__ \   ]],
      [[   _/ // /___/ ___ |/ /  / /___/ /   ]],
      [[  /___/\____/_/  |_/_/  /_//____/    ]],
    }
    --[=[
    dashboard.section.header.val = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }
]=]
    alpha.setup(startify.opts)
  end,
}

