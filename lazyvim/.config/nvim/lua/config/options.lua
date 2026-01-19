-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Show status line per-window
vim.o.laststatus = 2

-- No auto-format
vim.g.autoformat = false

-- Soft wrap
vim.o.wrap = true

-- Sync with system clipboard
vim.o.clipboard = "unnamedplus"

-- Scroll one line at a time with mouse, OS should handle scroll multiplier
vim.o.mousescroll = "ver:1,hor:2"
