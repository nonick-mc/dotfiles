return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    lazygit = {
      win = {
        border = "rounded",
      },
    },
    dashboard = {
      preset = {
        header = [[
  ___     ___    ___   __  __ /\_\    ___ ___    
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/ ]],
        keys = {
          { icon = "", desc = "New file", key = "e", action = ":enew" },
          { icon = "󰈙", desc = "Oil", key = "o", action = ":Oil --float" },
          {
            icon = "",
            desc = "Config",
            key = "c",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = "", desc = "Restore Session", key = "s", section = "session" },
          { icon = "󰒲", desc = "Lazy", key = "l", action = ":Lazy" },
          { icon = "󰅚", desc = "Quit", key = "q", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>E", false },
      { "<leader>e", false },
    },
  },
}
