function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "nvim-mini/mini.icons",
      "refractalize/oil-git-status.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Oil --preview --float<CR>", desc = "Explorer Oil" },
      { "<leader>E", "<cmd>Oil . --preview --float<CR>", desc = "Explorer Oil (cwd)" },
      { "<leader>fe", "<cmd>Oil --preview --float<CR>", desc = "Explorer Oil" },
      { "<leader>fE", "<cmd>Oil . --preview --float<CR>", desc = "Explorer Oil (cwd)" },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
        -- .DS_Storeを非表示
        is_always_hidden = function(name, _)
          local ignore_list = { ".DS_Store" }
          return vim.tbl_contains(ignore_list, name)
        end,
      },
      float = {
        border = "rounded",
      },
      win_options = {
        signcolumn = "yes:2",
      },
      delete_to_trash = true,
      confirmation = { border = "rounded" },
      preview_win = {
        preview_method = "load",
      },
    },
    config = function(_, opts)
      require("oil").setup(opts)
      require("oil-git-status").setup({})
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(args)
          local buf = args.buf
          if vim.bo[buf].filetype == "image" then
            return
          end
          local file = vim.api.nvim_buf_get_name(buf)
          if file ~= "" and Snacks.image.supports_file(file) then
            Snacks.image.buf.attach(buf)
          end
        end,
      })
    end,
  },
}
