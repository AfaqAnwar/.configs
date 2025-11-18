return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline     = { title = "COMMAND",   icon = "",  lang = "vim" },
          search_down = { title = "SEARCH ↓",   icon = "",  lang = "regex"},
          search_up   = { title = "SEARCH ↑",   icon = "",  lang = "regex"},
          filter      = { title = "FILTER",     icon = "$",  lang = "bash"},
          lua         = { title = "LUA",        icon = "",  lang = "lua"},
          help        = { title = "HELP",       icon = "",  lang = "" },
          input       = { title = "INPUT",      icon = "󰥻", lang = "" },
        },
      },
      lsp = {
        progress = { enabled = false },
        hover    = { enabled = false },
        signature = { enabled = false },
      },
      presets = {
        bottom_search          = false,
        command_palette        = false,
        long_message_to_split  = false,
        inc_rename             = false,
        lsp_doc_border         = false,
      },
      messages = { enabled = true, view_search = false },
      views = {
        cmdline_popup = {
          position = { row = "40%", col = "50%" },
          size     = { width = 62, height = "auto" },
          border   = {
            style   = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winblend = 0,
            winhighlight = {
              Normal      = "NoiceCmdNormal",
              FloatBorder = "NoiceCmdBorder",
            },
          },
        },
        popupmenu = {
          relative = "editor",
          position = { row = "47%", col = "50%" },
          size     = { width = 62, height = 10 },
          border   = { style = "rounded" },
          win_options = {
            winblend = 0,
            winhighlight = {
              Normal      = "NoiceCmdNormal",
              FloatBorder = "NoiceMenuBorder",
              Pmenu       = "NoiceCmdNormal",
              PmenuSel    = "NoiceMenuSel",
            },
          },
        },
      },
    })

    local C = {
      text   = "#c6d0f5",
      blue   = "#8caaee",
      subtle = "#51576d",
    }

    local function apply_hl()
      vim.api.nvim_set_hl(0, "NormalFloat",   { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder",   { bg = "NONE" })

      vim.api.nvim_set_hl(0, "NoiceCmdNormal", { bg = "NONE", fg = C.text })
      vim.api.nvim_set_hl(0, "NoiceCmdBorder", { bg = "NONE", fg = C.blue })
      vim.api.nvim_set_hl(0, "NoiceMenuBorder",{ bg = "NONE", fg = C.subtle })
      vim.api.nvim_set_hl(0, "NoiceMenuSel",   { bg = "NONE", fg = C.blue, bold = true })
    end

    apply_hl()
    vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
      group    = vim.api.nvim_create_augroup("NoiceTitleOverride", { clear = true }),
      callback = apply_hl,
    })
  end,
}

