# Ryaguzov Michael dotfiles

This is my personal collection of dotfiles configurations for UNIX-like systems, including Linux and macOS.

Configuration is provided for the following programs:

- `bash`, `zsh` (Shells)
- `nvim` (NeoVim)
- `tmux` (Terminal Multiplexer)

## Requirements

- `make`

## Setup

After cloning the repository, you can install all configurations by running the following command:

```bash
make
```

### Individual Installation

To install specific components of the configuration, you can use these commands:

```bash
make terminal # install shell configuration (bash/zsh)
make nvim     # install neo NeoVim configuration
```

### Restoration

A backup of your existing configuration files is created automatically before installation.

To restore these backups, run the following commands:

```bash
make terminal-restore # restore shell configurations (bash/zsh)
make nvim-restore     # restore NeoVim configuration
```
