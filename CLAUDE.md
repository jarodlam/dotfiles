# Dotfiles

Personal config for dev on Linux and Mac. Uses Nix as a cross-platform package manager,
Stow for dotfile symlinks, and Home Manager for Nix profile management.

## Auto-Update CLAUDE.md (MANDATORY)

**Update CLAUDE.md AS YOU GO, not at the end.** When you learn something new, update immediately.

**Skip:** Quick factual questions, trivial tasks with no new info.

**DO NOT ASK. Just update the files when you learn something.**

Do not add information to CLAUDE.md that includes state about this repo e.g. config, settings, etc.
Instead, add information about where to find the files that contain this state.

## Repo Structure

Each top-level directory is a Stow module (e.g. `stow lazyvim tmux zsh`):

- `lazyvim/` - Neovim config based on LazyVim
- `home-manager/` - Nix Home Manager flake config
- `tmux/` - tmux configuration
- `zsh/` - zsh shell config
- `starship/` - Starship prompt config
- `ghostty/` - Ghostty terminal config
- `iterm2/` - iTerm2 config
- `statix/` - Nix linter config

## LazyVim (Neovim) Config

Config root: `lazyvim/.config/nvim/`

### User Config Files

- `lua/config/options.lua` - Global vim options
- `lua/config/autocmds.lua` - Custom autocmds
- `lua/config/keymaps.lua` - Custom keymaps
- `lua/plugins/config.lua` - All plugin overrides in a single file (user prefers one file)
- `lazyvim.json` - Enabled LazyVim extras

### Design Decisions

- **Autoformat disabled**: `vim.g.autoformat = false`. Use `<leader>cF` for manual formatting.
- **Inlay hints disabled**: `vim.g.lazyvim_inlay_hints = false`. Toggle with `<leader>uh`.
- **Greyscale Catppuccin Mocha**: Custom colorscheme with transparent background and greyscale palette (no bluish tint).
- **Markdown diagnostics hidden**: Diagnostics disabled for markdown buffers via autocmd, but markdownlint stays available as a formatter via conform.nvim.
- **blink.cmp**: `<CR>` disabled for accepting completions; only `<C-y>` accepts.

### Debugging: Finding LazyVim and Plugin Source Files

When debugging plugin behavior, read the actual source code rather than guessing.

- **LazyVim core and extras**: `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/`
  - Default plugin specs: `plugins/` (e.g. `plugins/ui.lua`, `plugins/coding.lua`, `plugins/editor.lua`)
  - Language extras: `plugins/extras/lang/` (e.g. `markdown.lua`, `python.lua`)
  - Coding extras: `plugins/extras/coding/` (e.g. `blink.lua`)
  - Default options: `config/options.lua`
  - Default autocmds: `config/autocmds.lua`
  - Default keymaps: `config/keymaps.lua`
- **All installed plugins**: `~/.local/share/nvim/lazy/<plugin-name>/`
  - Plugin Lua source: `lua/` subdirectory
  - Default configs/settings: look for `config.lua`, `settings.lua`, or `defaults.lua`
  - Keymap presets (e.g. blink.cmp): `lua/<plugin>/keymap/presets.lua`
  - Formatter definitions (conform.nvim): `lua/conform/formatters/<name>.lua`
  - Render logic (render-markdown.nvim): `lua/render-markdown/render/`
- **Mason-installed tools**: `~/.local/share/nvim/mason/bin/` (not in PATH; use full path to test CLI tools)
- **Plugin lock file**: `lazyvim/.config/nvim/lazy-lock.json` (pinned versions of all plugins)

### Key Architecture Notes

- Plugin specs from user config, LazyVim defaults, and extras are all deep-merged by lazy.nvim. User overrides in `config.lua` merge with (not replace) LazyVim defaults.
- To understand a plugin's effective config, check both the user override in `config.lua` AND the LazyVim default/extra that configures it.
- render-markdown.nvim gotcha: `code.border = "hide"` (the default) hides entire code fence lines via `conceal_lines`. The `conceal_delimiters` option only does character-level conceal and has no visible effect when `border = "hide"`. The `language` option controls a virtual text overlay on the delimiter line that also visually replaces its content.
