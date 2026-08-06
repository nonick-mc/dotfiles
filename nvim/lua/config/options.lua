-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { "cwd" }

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.clipboard = ""
vim.opt.conceallevel = 0

-- custom title (nvim - {{cwd}})
vim.opt.title = true
vim.opt.titlestring = "nvim - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
vim.api.nvim_create_autocmd("DirChanged", {
  group = vim.api.nvim_create_augroup("UserTitleConfig", { clear = true }),
  callback = function()
    vim.opt.titlestring = "nvim - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end,
})
