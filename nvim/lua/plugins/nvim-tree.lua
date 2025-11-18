return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
    { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
  },

  opts = {
    view = {
      width = 32,
      side = "right",
      relativenumber = false,
      signcolumn = "yes",
    },
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true,
        icons = { corner = "└", edge = "│", item = "│", bottom = "─", none = " " },
      },
      icons = {
        git_placement = "after",
        show = { git = true, folder = true, file = true, folder_arrow = true },
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "󰁕",
            untracked = "",
            deleted = "✖",
            ignored = "",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = { hint = "󰌶", info = "󰋽", warning = "󰀪", error = "󰅚" },
    },
    filters = { dotfiles = false },
    git = { enable = true, ignore = false, timeout = 400 },
    update_focused_file = { enable = true, update_root = false },
    hijack_netrw = true,
    respect_buf_cwd = true,
  },

  config = function(_, opts)
    require("nvim-tree").setup(opts)

    local C = {
      rosewater = "#f2d5cf", flamingo = "#eebebe", pink = "#f4b8e4", mauve = "#ca9ee6",
      red = "#e78284", maroon = "#ea999c", peach = "#ef9f76", yellow = "#e5c890",
      green = "#a6d189", teal = "#81c8be", sky = "#99d1db", sapphire = "#85c1dc",
      blue = "#8caaee", lavender = "#babbf1", text = "#c6d0f5", subtext1 = "#b5bfe2",
      subtext0 = "#a5adce", overlay2 = "#949cbb", overlay1 = "#838ba7",
      overlay0 = "#737994", surface2 = "#626880", surface1 = "#51576d",
      surface0 = "#414559", base = "#303446", mantle = "#292c3c", crust = "#232634",
    }

    local function apply_tree_hl()
      vim.api.nvim_set_hl(0, "NvimTreeNormal",       { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NvimTreeNormalNC",     { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer",  { bg = "NONE", fg = "NONE" })
      vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "NONE", fg = C.overlay0 })

      vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = C.overlay0 })
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon",   { fg = C.blue })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderIcon", { fg = C.blue })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName",   { fg = C.blue, bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeRootFolder",   { fg = C.yellow, bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeExecFile",     { fg = C.green, bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeSpecialFile",  { fg = C.mauve, underline = true })

      vim.api.nvim_set_hl(0, "NvimTreeGitDirty",   { fg = C.yellow })
      vim.api.nvim_set_hl(0, "NvimTreeGitNew",     { fg = C.green })
      vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = C.red })
      vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = C.overlay1 })
    end
    apply_tree_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("NvimTreeTransparent", { clear = true }),
      callback = apply_tree_hl,
    })
  end,
}

