-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Show global status line instead of per-window
vim.o.laststatus = 3

-- Show filename at the top of each window
vim.opt.winbar = "%f"

-- No auto-format
vim.g.autoformat = false

-- Soft wrap
vim.o.wrap = true

-- Sync with system clipboard
vim.o.clipboard = "unnamedplus"

-- Scroll one line at a time with mouse, OS should handle scroll multiplier
vim.o.mousescroll = "ver:1,hor:2"
