# Dotfiles

A collection of configuration files for my development environment, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

Ensure you have GNU Stow installed on your system.

- **macOS:** `brew install stow`
- **Linux:** `sudo apt install stow` (or your distribution's package manager)

## Installation

1. Clone this repository into your home directory:
   ```bash
   git clone <repository-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Use Stow to symlink the configuration files to your home directory:
   ```bash
   stow .
   ```

This will create symbolic links in `~/` pointing to the files in `~/dotfiles/` (e.g., `~/.zshrc` -> `~/dotfiles/.zshrc`).

## Structure

- `.zshrc`, `.p10k.zsh`: Zsh shell configuration.
- `.tmux.conf`: Terminal multiplexer configuration.
- `conf/`: Miscellaneous configuration files (ignored by Stow via `.stow-global-ignore`).

## Managing Dotfiles

- **Adding a file:** Move the existing config file from your home directory to `~/dotfiles` and run `stow .`.
- **Updating:** Pull changes from the repository; the symlinks will automatically reflect the updates.
- **Removing:** To remove the symlinks created by Stow, run:
  ```bash
  stow -D .
  ```
