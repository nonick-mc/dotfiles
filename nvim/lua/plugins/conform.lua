return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome-check" },
        typescript = { "biome-check" },
        javascriptreact = { "biome-check" },
        typescriptreact = { "biome-check" },
      },
    },
  },
}
