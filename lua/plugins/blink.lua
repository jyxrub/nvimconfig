return {
    "saghen/blink.cmp",
    version = not vim.g.lazyvim_blink_main and "*",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    event = "VeryLazy",
    opts = {
        completion = {
            documentation = {
                auto_show = true,
            }
        },
        keymap = {
            preset = "super-tab",
        },
        sources = {
            default = { "path", "snippets", "buffer", "lsp" }
        },
        cmdline = {
            sources = function ()
                local cmd_type = vim.fn.getcmdtype()
                if cmd_type == "/" then
                    return {"buffer"}
                elseif cmd_type == ":" then
                    return {"cmdline"}
                else
                    return {}
                end
            end,
            keymap = {
                preset = "super-tab"
            },
            completion = {
                menu = {
                    auto_show = true,
                }
            },
        },
    },
}
