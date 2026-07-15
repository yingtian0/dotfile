return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
                         .-""""-.
                      .-'  .-.  '-.
                     /   .'   '.   \
                     \   \     /   /
                      '-. '---' .-'

   _   _ _____ ___
  | \ | | ____/ _ \
  |  \| |  _|| | | |
  | |\  | |__| |_| |
  |_| \_|_____\___/

    ____ ___ _____ __   __   ____  ___  ____
   / ___|_ _|_   _| \ | |  / ___|/ _ \|  _ \
  | |    | |  | | |  \| | | |   | | | | |_) |
  | |___ | |  | | | |\  | | |___| |_| |  __/
   \____|___| |_| |_| \_|  \____|\___/|_|

       ||       ||   ||       ||       ||
   ____||_______||___||_______||_______||____
  /___/___/___/___/___/___/___/___/___/___/

              N E O   T O K Y O   N I G H T
]],
        },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      local function set_dashboard_colors()
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {
          fg = "#ff4fd8",
          bold = true,
        })
        vim.api.nvim_set_hl(0, "SnacksDashboardKey", {
          fg = "#54e8ff",
          bold = true,
        })
        vim.api.nvim_set_hl(0, "SnacksDashboardDesc", {
          fg = "#c792ea",
        })
      end

      set_dashboard_colors()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_dashboard_colors,
        desc = "Keep the Neo Tokyo dashboard colors",
      })
    end,
  },
}
