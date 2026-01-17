# .configs

My personal configuration files for various development tools and applications.

## Contents

This repository contains configuration files for:

- **Fish Shell** - Shell configuration and custom functions
- **Neovim** - Editor settings and plugins
- **tmux** - Terminal multiplexer configuration
- **Karabiner** - macOS keyboard customization
- **Ghostty** - Terminal emulator settings
- **Cursor | VS Code** - Code editor profile

## Installation

### Install Tools

Install the required tools using Homebrew:

```
brew install fish nvim tmux ghostty tmux-mem-cpu-load
```

### Set Fish as Default Shell

```bash
# Add Fish to available shells
echo "$(which fish)" | sudo tee -a /etc/shells

# Set Fish as default shell
chsh -s $(which fish)
```

Quit and reopen your terminal, then verify Fish is your default shell:

```
echo $SHELL
```

This should show the path to the Fish shell.

### Configure Fish

Add Homebrew to Fish's PATH:

```
fish_add_path /opt/homebrew/bin
```

Install Fisher plugin manager and plugins:

```bash
# Install Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install plugins
fisher install jethrokuan/z
fisher install patrickf1/fzf.fish
fisher install rstacruz/fish-npm-global
fisher install jorgebucaran/nvm.fish
```

You'll also need to install fzf:

```
brew install fzf
```

### Setup Configuration Files

Clone this repository:

```
git clone https://github.com/AfaqAnwar/.configs.git
```

Move or symlink the configuration files to their respective locations:

- `config` → Edit your Ghostty config (⌘ + ,) and paste the contents
- `bin/ghostty-tmux.sh` → `~/.local/bin/ghostty-tmux.sh`
- `fish/` → `~/.config/fish/`
- `tmux/` → `~/.config/tmux/`
- `.tmux.conf` → `~/.tmux.conf`
- `nvim/` → `~/.config/nvim/`
- `karabiner/` → `~/.config/karabiner/`
- `Afaq.code-profile` → Your VS Code profiles directory

**Note**: The Ghostty config uses the `ghostty-tmux.sh` script to automatically start a tmux session upon launch and requires the [IBMPlexMono](https://fonts.google.com/selection) font family to be installed.

## Keybindings

### Karabiner

- **Caps Lock**: Tap for `Escape` / Hold for `Ctrl`
- **Return/Enter**: Tap for `Return` / Hold for `Ctrl`

These mappings make tmux and Neovim navigation significantly more ergonomic for myself.

### tmux

**Prefix**: `Caps Lock + A` (or `Return + A`)  
*With Karabiner installed and configured. Original keybind uses `Ctrl` instead of Caps Lock/Return*

#### General

| Command | Action |
|---------|--------|
| `Caps Lock + A` then `r` | Reload tmux config |
| `Caps Lock + A` then `v` | Enter copy mode |

#### Pane Navigation

| Command | Action |
|---------|--------|
| `Caps Lock + A` then `h` | Select left pane |
| `Caps Lock + A` then `j` | Select pane below |
| `Caps Lock + A` then `k` | Select pane above |
| `Caps Lock + A` then `l` | Select right pane |

#### Pane Resizing

| Command | Action |
|---------|--------|
| `Caps Lock + A` then `H` | Resize pane left |
| `Caps Lock + A` then `J` | Resize pane down |
| `Caps Lock + A` then `K` | Resize pane up |
| `Caps Lock + A` then `L` | Resize pane right |

#### Pane Splitting

| Command | Action |
|---------|--------|
| `Caps Lock + A` then `\` | Split horizontally (new pane to the right) |
| `Caps Lock + A` then `/` | Split vertically (new pane below) |

## Credits

This configuration setup was inspired by and built using the following resources:

- [macOS Fish Shell Setup](https://mmazzarolo.com/blog/2023-11-16-my-fish-shell-setup-on-macos/) by Matteo Mazzarolo
- [tmux theme inspiration](https://github.com/naivecynics/primary-tmux) by naivecynics
- [Ghostty Config Generator](https://ghostty.zerebos.com/settings/application)
