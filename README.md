# dotfiles

Personal config for dev on Linux and Mac machines.

Current philosophy is to use Nix purely as a cross-platform package manager.
Dotfiles are managed with Stow and system config is out of scope.

## Setup

Clone this repo.

```sh
git clone --recurse-submodules https://github.com/jarodlam/dotfiles.git ~/dotfiles/
```

Install Nix.

Install Home Manager into the Nix profile.

```sh
nix profile install github:NixOS/nixpkgs/nixos-25.11#home-manager --priority 0
```

Switch to Home Manager configuration.

```sh
home-manager switch --flake ~/dotfiles/home-manager#default --impure
```

Set the default shell to `zsh`.

```sh
sudo chsh -s "$(command -v zsh)" "${USER}"
```

Use Stow to symlink dotfiles.

```sh
cd ~/dotfiles
stow [MODULES...]
# e.g.
stow lazyvim tmux starship zsh
```

Remove specific Stow modules.

```sh
cd ~/dotfiles
stow -D [MODULES...]
```

Install Mac applications with Homebrew, including the Ghostty terminal emulator.

```sh
brew bundle install --file=~/dotfiles/homebrew/Brewfile
```

## Greyscale Catppuccin Mocha

This is a modification of the [Catppuccin Mocha palette](https://catppuccin.com/palette/)
that uses greyscale foreground and background colours with no bluish tint.

| Name | Original | Greyscale | Notes |
| --- | --- | --- | --- |
| Text | #cdd6f4 | #e1e1e1 | Foreground |
| Subtext 1 | #bac2de | #cccccc | ANSI 15 white bright |
| Subtext 0 | #a6adc8 | #b7b7b7 | ANSI 7 white |
| Overlay 2 | #9399b2 | #a2a2a2 | |
| Overlay 1 | #7f849c | #8e8e8e | |
| Overlay 0 | #6c7086 | #797979 | |
| Surface 2 | #585b70 | #646464 | ANSI 8 black bright |
| Surface 1 | #45475a | #505050 | ANSI 0 black |
| Surface 0 | #313244 | #3a3a3a | |
| Base | #101010 | #262626 | Background (modified to make it darker) |
| Mantle | #181825 | #1f1f1f | |
| Crust | #11111b | #161616 | |
