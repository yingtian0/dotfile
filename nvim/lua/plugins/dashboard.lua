local function centered(text, hl, padding)
  return {
    align = "center",
    padding = padding,
    text = {
      { text, hl = hl },
    },
  }
end

-- 文字本体の右側に暗い押し出し部分を追加する
local function logo_line(text, hl)
  return {
    align = "center",
    text = {
      { text, hl = hl },
      { "▓▓", hl = "NeoTokyoLogoEdge" },
    },
  }
end

local function build_sections()
  local sections = {}

  local function add(item)
    sections[#sections + 1] = item
  end

  -- ─────────────────────────────────────────────
  -- Skyline
  -- ─────────────────────────────────────────────

  add(centered(
    "                  ·              ✦                    ·",
    "NeoTokyoStars"
  ))

  add(centered(
    "        ·                         ·          ╱╲",
    "NeoTokyoStars"
  ))

  add(centered(
    "              ╱╲          ╭────────╮       ╱  ╲",
    "NeoTokyoSkylineTop"
  ))

  add(centered(
    "      ╭──────╯  ╰────╮ ╭──┤ ▪  ▪  ├──╮ ╭╯    ╰────╮",
    "NeoTokyoSkyline"
  ))

  add(centered(
    "  ╭───┤ ▪ ▪ ▪ ▪ ▪ ▪ ├─┤▓▓│ ▪  ▪  │▓▓├─┤ ▪ ▪ ▪ ▪ ├───╮",
    "NeoTokyoWindows"
  ))

  add(centered(
    "──┴───┴──────────────┴─┴──┴────────┴──┴─┴──────────┴───┴──",
    "NeoTokyoHorizon"
  ))

  -- Perspective road
  add(centered(
    "            ╲                                      ╱",
    "NeoTokyoRoad"
  ))

  add(centered(
    "             ╲________╲________╲________╲_________╱",
    "NeoTokyoRoadEdge",
    1
  ))

  -- ─────────────────────────────────────────────
  -- NEO
  -- ─────────────────────────────────────────────

  add(logo_line(
    "███╗   ██╗███████╗ ██████╗",
    "NeoTokyoLogo1"
  ))

  add(logo_line(
    "████╗  ██║██╔════╝██╔═══██╗",
    "NeoTokyoLogo2"
  ))

  add(logo_line(
    "██╔██╗ ██║█████╗  ██║   ██║",
    "NeoTokyoLogo3"
  ))

  add(logo_line(
    "██║╚██╗██║██╔══╝  ██║   ██║",
    "NeoTokyoLogo4"
  ))

  add(logo_line(
    "██║ ╚████║███████╗╚██████╔╝",
    "NeoTokyoLogo5"
  ))

  add(logo_line(
    "╚═╝  ╚═══╝╚══════╝ ╚═════╝",
    "NeoTokyoLogo6"
  ))

  -- NEO下部の影
  add(centered(
    " ░░   ░░░░  ░░░░░░░  ░░░░░░",
    "NeoTokyoLogoShadow",
    1
  ))

  -- ─────────────────────────────────────────────
  -- TOKYO
  -- ─────────────────────────────────────────────

  add(logo_line(
    "████████╗ ██████╗ ██╗  ██╗██╗   ██╗ ██████╗",
    "NeoTokyoLogo1"
  ))

  add(logo_line(
    "╚══██╔══╝██╔═══██╗██║ ██╔╝╚██╗ ██╔╝██╔═══██╗",
    "NeoTokyoLogo2"
  ))

  add(logo_line(
    "   ██║   ██║   ██║█████╔╝  ╚████╔╝ ██║   ██║",
    "NeoTokyoLogo3"
  ))

  add(logo_line(
    "   ██║   ██║   ██║██╔═██╗   ╚██╔╝  ██║   ██║",
    "NeoTokyoLogo4"
  ))

  add(logo_line(
    "   ██║   ╚██████╔╝██║  ██╗   ██║   ╚██████╔╝",
    "NeoTokyoLogo5"
  ))

  add(logo_line(
    "   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝",
    "NeoTokyoLogo6"
  ))

  -- TOKYO下部の影
  add(centered(
    "    ░░     ░░░░░░  ░░   ░░    ░░     ░░░░░░",
    "NeoTokyoLogoShadow"
  ))

  -- ─────────────────────────────────────────────
  -- Subtitle
  -- ─────────────────────────────────────────────

  add(centered(
    "N E O   T O K Y O   //   N I G H T   D R I V E",
    "NeoTokyoSubtitle"
  ))

  add(centered(
    "SYSTEM 09  •  LINK STABLE  •  READY",
    "NeoTokyoStatus",
    1
  ))

  add(centered(
    "╺━━━━━━━━━━━━━━  C O M M A N D   D E C K  ━━━━━━━━━━━━━━╸",
    "NeoTokyoDivider"
  ))

  -- メニュー
  add({
    section = "keys",
    gap = 0,
    padding = 1,
  })

  add(centered(
    "╺━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╸",
    "NeoTokyoDivider"
  ))

  -- 起動時間
  add({
    section = "startup",
    padding = 1,
  })

  return sections
end

return {
  {
    "folke/snacks.nvim",

    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.enabled = true

      -- アート最大幅に合わせる
      opts.dashboard.width = 66

      -- nilなら残りの編集領域中央へ配置される
      opts.dashboard.row = nil
      opts.dashboard.col = nil

      opts.dashboard.preset = opts.dashboard.preset or {}

      opts.dashboard.preset.keys = {
        {
          icon = " ",
          key = "f",
          desc = "Find File",
          action = ":lua Snacks.dashboard.pick('files')",
        },
        {
          icon = " ",
          key = "n",
          desc = "New File",
          action = ":ene | startinsert",
        },
        {
          icon = " ",
          key = "g",
          desc = "Find Text",
          action = ":lua Snacks.dashboard.pick('live_grep')",
        },
        {
          icon = " ",
          key = "r",
          desc = "Recent Files",
          action = ":lua Snacks.dashboard.pick('oldfiles')",
        },
        {
          icon = " ",
          key = "p",
          desc = "Projects",
          action = ":lua Snacks.picker.projects()",
        },
        {
          icon = " ",
          key = "c",
          desc = "Config",
          action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
        },
        {
          icon = " ",
          key = "s",
          desc = "Restore Session",
          section = "session",
        },
        {
          icon = "󰒲 ",
          key = "l",
          desc = "Lazy",
          action = ":Lazy",
          enabled = package.loaded.lazy ~= nil,
        },
        {
          icon = " ",
          key = "q",
          desc = "Quit",
          action = ":qa",
        },
      }

      -- デフォルトでは説明文の幅が広いため、
      -- キーが右端へ飛ばないよう幅を縮める
      opts.dashboard.formats = opts.dashboard.formats or {}

      opts.dashboard.formats.icon = {
        "%s",
        width = 3,
        hl = "SnacksDashboardIcon",
      }

      opts.dashboard.formats.desc = {
        "%s",
        width = 22,
        hl = "SnacksDashboardDesc",
      }

      opts.dashboard.formats.key = {
        "[%s]",
        hl = "SnacksDashboardKey",
      }

      opts.dashboard.formats.footer = {
        "%s",
        align = "center",
        hl = "SnacksDashboardFooter",
      }

      opts.dashboard.sections = build_sections()

      return opts
    end,

    init = function()
      local function set_dashboard_colors()
        -- City
        vim.api.nvim_set_hl(0, "NeoTokyoStars", {
          fg = "#bb9af7",
        })

        vim.api.nvim_set_hl(0, "NeoTokyoSkylineTop", {
          fg = "#7dcfff",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoSkyline", {
          fg = "#2ac3de",
        })

        vim.api.nvim_set_hl(0, "NeoTokyoWindows", {
          fg = "#ff9e64",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoHorizon", {
          fg = "#3d59a1",
        })

        vim.api.nvim_set_hl(0, "NeoTokyoRoad", {
          fg = "#565f89",
        })

        vim.api.nvim_set_hl(0, "NeoTokyoRoadEdge", {
          fg = "#7aa2f7",
        })

        -- Logo face: 上から下へ暗くする
        vim.api.nvim_set_hl(0, "NeoTokyoLogo1", {
          fg = "#ff8ce8",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoLogo2", {
          fg = "#ff6bd6",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoLogo3", {
          fg = "#ff4fc3",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoLogo4", {
          fg = "#e946c7",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoLogo5", {
          fg = "#c53dcc",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoLogo6", {
          fg = "#9d4edd",
          bold = true,
        })

        -- 右側の押し出し部分
        vim.api.nvim_set_hl(0, "NeoTokyoLogoEdge", {
          fg = "#3d4270",
        })

        -- 下側の影
        vim.api.nvim_set_hl(0, "NeoTokyoLogoShadow", {
          fg = "#303553",
        })

        vim.api.nvim_set_hl(0, "NeoTokyoSubtitle", {
          fg = "#ff9e64",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "NeoTokyoStatus", {
          fg = "#2ac3de",
        })

        vim.api.nvim_set_hl(0, "NeoTokyoDivider", {
          fg = "#414868",
        })

        -- Menu
        vim.api.nvim_set_hl(0, "SnacksDashboardIcon", {
          fg = "#ff4fc3",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "SnacksDashboardDesc", {
          fg = "#c0caf5",
        })

        vim.api.nvim_set_hl(0, "SnacksDashboardKey", {
          fg = "#54e8ff",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "SnacksDashboardFooter", {
          fg = "#565f89",
          italic = true,
        })
      end

      local group = vim.api.nvim_create_augroup(
        "NeoTokyoDashboardColors",
        { clear = true }
      )

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_dashboard_colors,
        desc = "Restore Neo Tokyo dashboard colors",
      })

      set_dashboard_colors()
    end,
  },
}
