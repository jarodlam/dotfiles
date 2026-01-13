return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      color_overrides = {
        -- Greyscale Catppuccin overrides
        mocha = {
          text = "#e1e1e1",
          subtext1 = "#cccccc",
          subtext0 = "#b7b7b7",
          overlay2 = "#a2a2a2",
          overlay1 = "#8e8e8e",
          overlay0 = "#797979",
          surface2 = "#646464",
          surface1 = "#505050",
          surface0 = "#3a3a3a",
          -- base = "#262626",
          base = "#000000",
          mantle = "#1f1f1f",
          crust = "#161616",
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
      },
      explorer = {
        enabled = false,
      },
      picker = {
        formatters = {
          file = {
            filename_first = true,
          },
        },
        hidden = true, -- for hidden files
        ignored = false, -- for .gitignore files
        sources = {
          files = {
            hidden = true,
            ignored = false,
          },
        },
      },
      scroll = {
        animate = {
          duration = { step = 5, total = 100 },
          easing = "linear",
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
          delay = 100, -- delay in ms before using the repeat animation
          duration = { step = 5, total = 50 },
          easing = "linear",
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false
            and vim.b[buf].snacks_scroll ~= false
            and vim.bo[buf].buftype ~= "terminal"
        end,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- theme = "catppuccin",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          "filename",
          {
            "diagnostics",
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
          },
        },
        -- lualine_x is LazyVim default
        lualine_y = { "lsp_status" },
        lualine_z = {
          { "location", separator = { left = "", right = "" }, left_padding = 0 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    },
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    enabled = true,
  },
  {
    "dstein64/nvim-scrollview",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        -- options used when flash is activated through
        -- a regular search with `/` or `?`
        search = {
          -- when `true`, flash will be activated during regular search by default.
          -- You can always toggle when searching with `require("flash").toggle()`
          enabled = true,
        },
      },
    },
  },
  "nvim-mini/mini.files",
  opts = {
    windows = {
      preview = true,
      width_focus = 50,
      width_preview = 30,
    },
    options = {
      -- Whether to use for editing directories
      use_as_default_explorer = true,
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- https://github.com/mason-org/mason.nvim/issues/1578#issuecomment-2927987751
          mason = false, -- Skip Mason installation
          cmd = {
            "clangd", -- Use system clangd (from the PATH env variable)
          },
        },
        nil_ls = {
          settings = {
            ['nil'] = {
              nix = {
                flake = {
                  -- Don't automatically fetch flake inputs
                  -- https://github.com/oxalica/nil/blob/main/docs/configuration.md
                  autoArchive = false,
                }
              }
            }
          }
        }
      },
    },
  },
}
