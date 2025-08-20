return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      transparent_background = true,
      -- default_integrations = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "catppuccin",
      options = {
        component_separators = " ",
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    optional = true,

    -- temp fix https://github.com/LazyVim/LazyVim/pull/6354
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,

    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get_theme(),
      options = {
        separator_style = "thin",
      },
    },
  },
}
