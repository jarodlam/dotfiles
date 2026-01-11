# dotfiles

Personal config for dev on Linux and Mac machines.

## Setup

Clone this repo.

```sh
git clone --recurse-submodules https://github.com/jarodlam/dotfiles.git ~/dotfiles/
```

Install Nix and Home Manager: <https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone>

```sh
home-manager switch --flake ~/dotfiles/home-manager#default --impure
```

Install [Ghostty](https://ghostty.org) manually.

Dotfiles are managed with Stow, they may be migrated to Home Manager some day.

```sh
cd ~/dotfiles
stow [MODULES...]
# e.g.
stow nvim tmux starship zsh
```

To remove a specific Stow module:

```sh
cd ~/dotfiles
stow -D .
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
