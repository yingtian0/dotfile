return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "dark",
        floats = "dark",
      },
      on_colors = function(colors)
        colors.bg = "#0a0e1a"
        colors.bg_dark = "#060914"
        colors.bg_float = "#11182b"
        colors.bg_highlight = "#182342"
        colors.border = "#414868"
        colors.comment = "#565f89"
        colors.fg = "#c0caf5"
        colors.fg_dark = "#7982a9"
        colors.fg_gutter = "#3d59a1"
        colors.blue = "#54e8ff"
        colors.cyan = "#2ac3de"
        colors.green = "#73daca"
        colors.magenta = "#ff4fc3"
        colors.orange = "#ff9e64"
        colors.purple = "#bb9af7"
        colors.error = "#f7768e"
        colors.warning = "#ff9e64"
      end,
      on_highlights = function(hl, colors)
        -- Editor
        hl.Normal = { fg = colors.fg, bg = colors.bg }
        hl.NormalFloat = { fg = colors.fg, bg = colors.bg_float }
        hl.CursorLine = { bg = colors.bg_highlight }
        hl.CursorLineNr = { fg = colors.cyan, bold = true }
        hl.LineNr = { fg = colors.fg_gutter }
        hl.Visual = { bg = "#2a2f4a" }
        hl.Search = { fg = colors.bg, bg = colors.orange, bold = true }
        hl.IncSearch = { fg = colors.bg, bg = colors.magenta, bold = true }
        hl.MatchParen = { fg = colors.cyan, bg = colors.bg_highlight, bold = true }
        hl.WinSeparator = { fg = colors.border }
        hl.StatusLine = { fg = colors.fg, bg = colors.bg_float }
        hl.StatusLineNC = { fg = colors.fg_dark, bg = colors.bg_dark }

        -- Syntax
        hl.Comment = { fg = colors.comment, italic = true }
        hl.Constant = { fg = colors.orange }
        hl.Function = { fg = colors.cyan, bold = true }
        hl.Keyword = { fg = colors.magenta, italic = true }
        hl.Operator = { fg = colors.cyan }
        hl.String = { fg = colors.green }
        hl.Type = { fg = colors.purple }

        -- Completion and diagnostics
        hl.Pmenu = { fg = colors.fg, bg = colors.bg_float }
        hl.PmenuSel = { fg = colors.bg, bg = colors.cyan, bold = true }
        hl.FloatBorder = { fg = colors.border, bg = colors.bg_float }
        hl.DiagnosticError = { fg = colors.error }
        hl.DiagnosticWarn = { fg = colors.warning }
        hl.DiagnosticInfo = { fg = colors.cyan }
        hl.DiagnosticHint = { fg = colors.purple }

        -- Snacks picker and file explorer
        hl.SnacksPickerBorder = { fg = colors.border, bg = colors.bg_float }
        hl.SnacksPickerTitle = { fg = colors.magenta, bold = true }
        hl.SnacksExplorerDir = { fg = colors.cyan, bold = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
