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
      custom_highlights = function()
        return {
          WinBar = { bold = true, italic = true },
          NormalFloat = { link = "Normal" }, -- transparent floats (picker, hover, etc.)
          FloatBorder = { bg = "NONE" },
        }
      end,
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
          -- base = "#000000",
          base = "#101010",
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
        layout = {
          fullscreen = true,
        },
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
          explorer = {
            layout = { fullscreen = false, preset = "sidebar" },
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
    -- This is copied from the default LazyVim config, then modified
    -- https://www.lazyvim.org/plugins/ui
    opts = {
      options = {
        -- theme = "catppuccin",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              if vim.api.nvim_win_get_width(0) >= 80 then
                return str
              else
                return str:sub(1, 1)
              end
            end,
            separator = { left = "", right = "" },
          },
        },
        lualine_b = {
          {
            "branch",
            cond = function()
              return vim.api.nvim_win_get_width(0) >= 80
            end,
          },
        },
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
        lualine_x = {
          require("snacks").profiler.status(),
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"]
                and require("noice").api.status.command.has()
                and vim.api.nvim_win_get_width(0) >= 80
            end,
            color = function()
              return { fg = require("snacks").util.color("Statement") }
            end,
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"]
                and require("noice").api.status.mode.has()
                and vim.api.nvim_win_get_width(0) >= 80
            end,
            color = function()
              return { fg = require("snacks").util.color("Constant") }
            end,
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= "" and vim.api.nvim_win_get_width(0) >= 80
            end,
            color = function()
              return { fg = require("snacks.util").color("Debug") }
            end,
          },
          {
            "diff",
            symbols = {
              added = require("lazyvim.config").icons.git.added,
              modified = require("lazyvim.config").icons.git.modified,
              removed = require("lazyvim.config").icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
            cond = function()
              return vim.api.nvim_win_get_width(0) >= 80
            end,
          },
        },
        lualine_y = {
          {
            "lsp_status",
            cond = function()
              return vim.api.nvim_win_get_width(0) >= 80
            end,
          },
        },
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
    "akinsho/bufferline.nvim",
    config = function(_, opts)
      local C = require("catppuccin.palettes").get_palette()
      local pill_bg = C.surface0
      local fill_bg = C.base

      -- Pill-shaped tab highlights using catppuccin palette
      opts.highlights = {
        fill = { bg = fill_bg },
        background = { fg = C.overlay1, bg = fill_bg },
        buffer_selected = { fg = C.text, bg = pill_bg, bold = true, italic = false },
        buffer_visible = { fg = C.overlay1, bg = fill_bg },

        separator = { fg = fill_bg, bg = fill_bg },
        separator_selected = { fg = pill_bg, bg = fill_bg },
        separator_visible = { fg = fill_bg, bg = fill_bg },

        close_button = { fg = C.surface2, bg = fill_bg },
        close_button_selected = { fg = C.text, bg = pill_bg },
        close_button_visible = { fg = C.surface2, bg = fill_bg },

        modified = { fg = C.peach, bg = fill_bg },
        modified_selected = { fg = C.peach, bg = pill_bg },
        modified_visible = { fg = C.peach, bg = fill_bg },

        duplicate = { fg = C.surface2, bg = fill_bg, italic = true },
        duplicate_selected = { fg = C.subtext1, bg = pill_bg, italic = true },
        duplicate_visible = { fg = C.surface2, bg = fill_bg, italic = true },

        indicator_selected = { fg = pill_bg, bg = pill_bg },
        indicator_visible = { fg = fill_bg, bg = fill_bg },

        diagnostic = { fg = C.subtext0, bg = fill_bg },
        diagnostic_selected = { fg = C.subtext0, bg = pill_bg },
        diagnostic_visible = { fg = C.subtext0, bg = fill_bg },
        error = { fg = C.red, bg = fill_bg },
        error_selected = { fg = C.red, bg = pill_bg },
        error_visible = { fg = C.red, bg = fill_bg },
        error_diagnostic = { fg = C.red, bg = fill_bg },
        error_diagnostic_selected = { fg = C.red, bg = pill_bg },
        error_diagnostic_visible = { fg = C.red, bg = fill_bg },
        warning = { fg = C.yellow, bg = fill_bg },
        warning_selected = { fg = C.yellow, bg = pill_bg },
        warning_visible = { fg = C.yellow, bg = fill_bg },
        warning_diagnostic = { fg = C.yellow, bg = fill_bg },
        warning_diagnostic_selected = { fg = C.yellow, bg = pill_bg },
        warning_diagnostic_visible = { fg = C.yellow, bg = fill_bg },
        info = { fg = C.sky, bg = fill_bg },
        info_selected = { fg = C.sky, bg = pill_bg },
        info_visible = { fg = C.sky, bg = fill_bg },
        info_diagnostic = { fg = C.sky, bg = fill_bg },
        info_diagnostic_selected = { fg = C.sky, bg = pill_bg },
        info_diagnostic_visible = { fg = C.sky, bg = fill_bg },
        hint = { fg = C.teal, bg = fill_bg },
        hint_selected = { fg = C.teal, bg = pill_bg },
        hint_visible = { fg = C.teal, bg = fill_bg },
        hint_diagnostic = { fg = C.teal, bg = fill_bg },
        hint_diagnostic_selected = { fg = C.teal, bg = pill_bg },
        hint_diagnostic_visible = { fg = C.teal, bg = fill_bg },

        numbers = { fg = C.subtext0, bg = fill_bg },
        numbers_selected = { fg = C.subtext0, bg = pill_bg },
        numbers_visible = { fg = C.subtext0, bg = fill_bg },
        pick = { fg = C.red, bg = fill_bg },
        pick_selected = { fg = C.red, bg = pill_bg },
        pick_visible = { fg = C.red, bg = fill_bg },

        tab = { fg = C.overlay1, bg = fill_bg },
        tab_selected = { fg = C.text, bg = pill_bg, bold = true, italic = false },
        tab_separator = { fg = fill_bg, bg = fill_bg },
        tab_separator_selected = { fg = pill_bg, bg = fill_bg },
        tab_close = { fg = C.red, bg = fill_bg },
        trunc_marker = { fg = C.overlay1, bg = fill_bg },
      }

      -- Monkey-patch slant separator chars to round Powerline chars for pill-shaped tabs
      local constants = require("bufferline.constants")
      constants.sep_chars[constants.sep_names.slant] = { "\xee\x82\xb4", "\xee\x82\xb6" }
      require("bufferline").setup(opts)

      -- Fix one-space gap between left pill cap and tab content:
      -- In slant mode, the indicator space inherits the separator highlight (bg=fill)
      -- instead of the buffer highlight (bg=pill). Wrap the global tabline function
      -- to insert the correct highlight before that indicator space.
      local orig_tabline = _G.nvim_bufferline
      _G.nvim_bufferline = function()
        local result = orig_tabline()
        -- Fix left pill gap: inject BufferSelected highlight before the indicator space
        result = result:gsub("(%%#BufferLineSeparatorSelected#...)([ ])", "%1%%#BufferLineBufferSelected#%2")
        -- Fix right pill gap: remove trailing space before the right pill cap
        result = result:gsub(" (%%#BufferLineSeparatorSelected#\xee\x82\xb4)", "%1")
        return result
      end
    end,
    opts = {
      options = {
        separator_style = "slant",
        always_show_bufferline = true,
        tab_size = 0,
      },
    },
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
    "RyanMillerC/better-vim-tmux-resizer",
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        nix = {}, -- Disable statix
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        buf_ls = {
          root_dir = function(bufnr, on_dir)
            -- Root is the nearest ancestor named proto/protos, or containing buf.yaml/.git
            local proto = vim.fs.find({ "proto", "protos" }, {
              upward = true,
              type = "directory",
              path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
            })[1]
            on_dir(proto or vim.fs.root(bufnr, { "buf.yaml", ".git" }))
          end,
        },
        clangd = {
          -- https://github.com/mason-org/mason.nvim/issues/1578#issuecomment-2927987751
          mason = false, -- Skip Mason installation
          cmd = {
            "clangd", -- Use system clangd (from the PATH env variable)
          },
        },
        nil_ls = {
          mason = false, -- Installed via Nix in neovim-dependencies
          settings = {
            ["nil"] = {
              nix = {
                flake = {
                  -- Don't automatically fetch flake inputs
                  -- https://github.com/oxalica/nil/blob/main/docs/configuration.md
                  autoArchive = false,
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Don't accept changes on carriage return
        ["<CR>"] = false,
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        -- Only highlight heading text, not entire line
        width = "block",
        border = "thin",
      },
      code = {
        -- Prevents code block end delimiters from hiding the whole line
        border = "thin",
      },
    },
  },
  {
    "tadaa/vimade",
    opts = {
      recipe = { "default" },
      fadelevel = 0.7,
      enablefocusfading = true, -- tmux support
      ncmode = "windows", -- fade by window, not buffer
    },
  },
}
