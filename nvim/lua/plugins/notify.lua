return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")
        local C = {
            text = "#c6d0f5",
            overlay0 = "#737994",
            surface1 = "#51576d",
            surface2 = "#626880",
            blue = "#8caaee",
            green = "#a6d189",
            yellow = "#e5c890",
            red = "#e78284",
            mauve = "#ca9ee6",
            base = "#303446"
        }
        notify.setup(
            {
                stages = "fade_in_slide_out",
                render = "compact",
                fps = 120,
                timeout = 2500,
                top_down = true,
                minimum_width = 28,
                max_width = function()
                    return math.floor(vim.o.columns * 0.4) - 6
                end,
                max_height = function()
                    return math.floor(vim.o.lines * 0.30)
                end,
                background_colour = "#000000",
                icons = {ERROR = "󰅚", WARN = "󰀪", INFO = "󰋽", DEBUG = "", TRACE = "✎"},
                on_open = function(win)
                    vim.api.nvim_set_option_value("winblend", 15, {win = win})
                    vim.api.nvim_win_set_option(
                        win,
                        "winhighlight",
                        "Normal:NotifyTransparent,FloatBorder:NotifyBorder,FloatTitle:NotifyTitle"
                    )
                end
            }
        )
        vim.notify = notify
        local function apply_notify_hl()
            vim.api.nvim_set_hl(0, "NotifyTransparent", {bg = "NONE", fg = C.text})
            vim.api.nvim_set_hl(0, "NotifyBorder", {bg = "NONE", fg = C.overlay0})
            vim.api.nvim_set_hl(0, "NotifyTitle", {bg = "NONE", fg = C.mauve, bold = true})
            vim.api.nvim_set_hl(0, "NotifyERRORBorder", {bg = "NONE", fg = C.red})
            vim.api.nvim_set_hl(0, "NotifyWARNBorder", {bg = "NONE", fg = C.yellow})
            vim.api.nvim_set_hl(0, "NotifyINFOBorder", {bg = "NONE", fg = C.blue})
            vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", {bg = "NONE", fg = C.surface2})
            vim.api.nvim_set_hl(0, "NotifyTRACEBorder", {bg = "NONE", fg = C.mauve})
            vim.api.nvim_set_hl(0, "NotifyERRORTitle", {bg = "NONE", fg = C.red, bold = true})
            vim.api.nvim_set_hl(0, "NotifyWARNTitle", {bg = "NONE", fg = C.yellow, bold = true})
            vim.api.nvim_set_hl(0, "NotifyINFOTitle", {bg = "NONE", fg = C.blue, bold = true})
            vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", {bg = "NONE", fg = C.surface2, bold = true})
            vim.api.nvim_set_hl(0, "NotifyTRACETitle", {bg = "NONE", fg = C.mauve, bold = true})
            vim.api.nvim_set_hl(0, "NotifyERRORBody", {bg = "NONE", fg = C.text})
            vim.api.nvim_set_hl(0, "NotifyWARNBody", {bg = "NONE", fg = C.text})
            vim.api.nvim_set_hl(0, "NotifyINFOBody", {bg = "NONE", fg = C.text})
            vim.api.nvim_set_hl(0, "NotifyDEBUGBody", {bg = "NONE", fg = C.text})
            vim.api.nvim_set_hl(0, "NotifyTRACEBody", {bg = "NONE", fg = C.text})
        end
        apply_notify_hl()
        vim.api.nvim_create_autocmd(
            "ColorScheme",
            {group = vim.api.nvim_create_augroup("NotifyTheming", {clear = true}), callback = apply_notify_hl}
        )
        vim.keymap.set(
            "n",
            "<leader>x",
            function()
                require("notify").dismiss({silent = true, pending = true})
            end,
            {desc = "Dismiss notifications"}
        )
    end
}

