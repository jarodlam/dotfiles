# dotfiles

Personal config for dev on Linux and Mac machines.

## Requirements

- [stow](https://www.gnu.org/software/stow/)
- [zsh](https://zsh.org)
- [tmux](https://github.com/tmux/tmux)
- [Starship](https://starship.rs)
- [Meslo Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- Terminal emulator
  - [Alacritty](https://github.com/alacritty/alacritty) (Linux)
  - [iTerm2](https://iterm2.com/) (Mac)
- [NeoVim](https://neovim.io/)
  - System dependencies
    - [lazygit](https://github.com/jesseduffield/lazygit)
    - [fzf](https://github.com/junegunn/fzf)
    - [ripgrep](https://github.com/BurntSushi/ripgrep)
    - [fd/fd-find/fdfind](https://github.com/sharkdp/fd)
  - Language server dependencies
    - [Node](https://github.com/nvm-sh/nvm)
    - [Rust](https://rustup.rs/)
    - May also need `unzip`, `python3-venv`, and `clang`

## Usage

Clone to home directory.

```sh
cd ~
git clone --recurse-submodules https://github.com/jarodlam/dotfiles.git
```

Creates symlinks in home directory for each desired module. Run this every time a new file is added.

```sh
cd ~/dotfiles
stow [MODULES...]
# e.g.
stow nvim tmux starship zsh
```

## Removal

Removes all symlinks.

```sh
cd ~/dotfiles
stow -D .
```

## Installation notes

### Alacritty

Alacritty is configured to use borderless mode, hiding all window controls. Use GNOME keyboard shortcuts to move the window:

- `Alt+F7`: move
- `Alt+F8`: resize
- `Alt+F10`: maximise

### iTerm2

The iTerm2 profile should appear under Settings as a Dynamic Profile and set most things up. Some manual config is still required:

- In `Profiles > General`, set the `JL` profile as default.
- In `Appearance > General`, set `Theme` to `Minimal`. Optionally, set `Tab Bar Location` to `bottom` to remove the title bar altogether.
- In `Appearance > Panes`, set all `Side/Top & Bottom margins` to `0`.

### Meslo Nerd Font

On Mac, install using Homebrew.

```sh
brew install --cask font-meslo-lg-nerd-font
```

On Linux, install using the install script.

```sh
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
./install.sh Meslo
```

## Greyscale Catppuccin Mocha

This is a modification of the [Catppuccin Mocha palette](https://catppuccin.com/palette/) that uses greyscale foreground and background colours with no bluish tint:

| Name | Original | Greyscale | Notes |
| --- | --- | --- | --- |
| Text | #cdd6f4 | #e1e1e1 | Foreground |
| Subtext 1 | #bac2de | #cccccc | ANSI 15 white bright |
| Subtext 0 | #a6adc8 | #b7b7b7 | ANSI 7 white |
| Overlay 2 | #9399b2 | #a2a2a2 |  |
| Overlay 1 | #7f849c | #8e8e8e |  |
| Overlay 0 | #6c7086 | #797979 |  |
| Surface 2 | #585b70 | #646464 | ANSI 8 black bright |
| Surface 1 | #45475a | #505050 | ANSI 0 black |
| Surface 0 | #313244 | #3a3a3a |  |
| Base | #1e1e2e | #262626 | Background |
| Mantle | #181825 | #1f1f1f |  |
| Crust | #11111b | #161616 |  |
