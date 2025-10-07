# dotfiles

## Overview
Personal dotfiles for development environment configuration and setup.

## Supported OS
- macOS

## Stack
This repository installs and configures the following development environment.

### Core Dependencies

- [mise](https://github.com/jdx/mise): Runtime manager
- [homebrew](https://brew.sh): Package manager
- [GNU Stow](https://www.gnu.org/software/stow): Symlink manager for dotfiles

### Runtimes
This repository installs these runtimes using [mise](https://github.com/jdx/mise).

- Node.js
- Python

### Tools
This repository installs these thools. It manages configurations using [GNU Stow](https://www.gnu.org/software/stow).

- [zsh](https://www.zsh.org): Command interpreter for shell scripting
- [wezterm](https://wezterm.org): Terminal emulator
- [neovim](https://neovim.io): Text editor
- [tmux](https://github.com/tmux/tmux): Terminal multiplexer
- [tig](https://github.com/jonas/tig): Text-mode interface for Git

## Setup
The following command sets up a development environment on your PC.

```shell
curl -sf https://raw.githubusercontent.com/kmrosol/dotfiles/main/bootstrap.sh | sh -s
```
