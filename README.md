# dotfiles

Personal config for dev on Linux and Mac machines.

## Requirements

- [stow](https://www.gnu.org/software/stow/)
- [zsh](https://zsh.org)
  - [Starship](https://starship.rs)
- [tmux](https://github.com/tmux/tmux)
- [Alacritty](https://github.com/alacritty/alacritty)
- [NeoVim](https://neovim.io/)
  - LazyVim dependencies
    - [Meslo Nerd Font](https://github.com/ryanoasis/nerd-fonts)
    - [lazygit](https://github.com/jesseduffield/lazygit)
    - [fzf](https://github.com/junegunn/fzf)
    - [ripgrep](https://github.com/BurntSushi/ripgrep)
    - [fd/fd-find/fdfind](https://github.com/sharkdp/fd)
  - Language server dependencies
    - [Node](https://github.com/nvm-sh/nvm)
    - [Rust](https://rustup.rs/)

## Usage

Clone to home directory.

```sh
cd ~
git clone git@github.com:jarodlam/dotfiles.git
```

Create symlinks in home directory for `stow`. Run this every time a new file is added.

```sh
cd ~/dotfiles
stow .
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
