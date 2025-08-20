return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable Pyright, use Ruff only.
        pyright = {
          mason = false,
          autostart = false,
        },
      },
    },
  },
}
