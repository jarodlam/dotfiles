# dotfiles

Personal config for dev on Linux and Mac machines.

## Requirements

- [stow](https://www.gnu.org/software/stow/)
- [zsh](https://zsh.org)
  - [Oh My Zsh](https://ohmyz.sh/)
  - [Starship](https://starship.rs)
- [tmux](https://github.com/tmux/tmux)
- [Alacritty](https://github.com/alacritty/alacritty)
- [NeoVim](https://neovim.io/)
  - LazyVim dependencies
    - [Meslo Nerd Font](https://github.com/ryanoasis/nerd-fonts) `./install.sh Meslo`
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

Create symlinks in home directory for stow.

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
