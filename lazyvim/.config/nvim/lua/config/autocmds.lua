-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable persistence.nvim session saving for single /tmp files
-- This is primarily for Claude Code prompts at /tmp/claude-promt-*.md
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "/tmp/*",
  callback = function()
    local bufs = vim.tbl_filter(function(b)
      return vim.bo[b].buftype == "" and vim.api.nvim_buf_get_name(b) ~= ""
    end, vim.api.nvim_list_bufs())
    if #bufs == 1 then
      require("persistence").stop()
    end
  end,
})

-- Disable diagnostics for markdown files (markdownlint stays available for formatting/fixing)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})
