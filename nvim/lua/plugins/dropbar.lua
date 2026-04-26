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
