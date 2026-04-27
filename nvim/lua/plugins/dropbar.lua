return {
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })

      require("dropbar").setup({
        bar = {
          enable = function(buf, win)
            local disable_ft = { "oil" }

            return not vim.api.nvim_win_get_config(win).zindex
              and vim.bo[buf].buftype == ""
              and vim.api.nvim_buf_get_name(buf) ~= ""
              and not vim.tbl_contains(disable_ft, vim.api.nvim_get_option_value("filetype", { buf = buf }))
              and not vim.wo[win].diff
          end,
          sources = function()
            local sources = require("dropbar.sources")
            return {
              sources.path,
            }
          end,
        },
        sources = {
          path = {
            modified = function(sym)
              return sym:merge({
                name = sym.name .. " ",
                name_hl = "DiffAdded",
              })
            end,
          },
        },
      })
    end,
  },
}
