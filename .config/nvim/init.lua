-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.g.autoformat = false

require("lspconfig").clangd.setup {
  cmd = { "clangd", "--background-index", "--log=verbose" },
  -- other config options...
}

