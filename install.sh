#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
NVIM_CONFIG="$CONFIG_HOME/nvim"
TMUX_CONFIG="$HOME/.tmux.conf"
TMUX_PLUGIN_DIR="$HOME/.tmux/plugins/tpm"
TMUX_AUTOSTART="$SCRIPT_DIR/shell/tmux-auto-start.sh"
ZPROFILE="$HOME/.zprofile"
ZSHRC="$HOME/.zshrc"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This installer is for macOS only." >&2
  exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required to install Homebrew." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Installing it now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  echo "Homebrew was not found after installation." >&2
  exit 1
fi

mkdir -p "$(dirname -- "$ZPROFILE")"
if ! grep -Fq 'brew shellenv' "$ZPROFILE" 2>/dev/null; then
  {
    echo ""
    echo "# Homebrew"
    if [[ -x /opt/homebrew/bin/brew ]]; then
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    else
      echo 'eval "$(/usr/local/bin/brew shellenv)"'
    fi
  } >> "$ZPROFILE"
fi

brew bundle --file="$SCRIPT_DIR/Brewfile"

OPENJDK_PREFIX="$(brew --prefix openjdk@21)"
JDK_LINK="/Library/Java/JavaVirtualMachines/openjdk-21.jdk"
if [[ ! -e "$JDK_LINK" ]]; then
  sudo mkdir -p /Library/Java/JavaVirtualMachines
  sudo ln -sfn "$OPENJDK_PREFIX/libexec/openjdk.jdk" "$JDK_LINK"
fi

if [[ ! -e "$TMUX_CONFIG" && ! -L "$TMUX_CONFIG" ]]; then
  ln -s "$SCRIPT_DIR/tmux/.tmux.conf" "$TMUX_CONFIG"
elif [[ -L "$TMUX_CONFIG" && "$(readlink "$TMUX_CONFIG")" == "$SCRIPT_DIR/tmux/.tmux.conf" ]]; then
  :
else
  backup="$TMUX_CONFIG.backup.$(date +%Y%m%d-%H%M%S)"
  mv "$TMUX_CONFIG" "$backup"
  ln -s "$SCRIPT_DIR/tmux/.tmux.conf" "$TMUX_CONFIG"
  echo "Existing tmux config moved to: $backup"
fi

mkdir -p "$(dirname -- "$TMUX_PLUGIN_DIR")"
if [[ ! -e "$TMUX_PLUGIN_DIR" ]]; then
  echo "Installing TPM (tmux plugin manager)..."
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TMUX_PLUGIN_DIR"
fi
if [[ -x "$TMUX_PLUGIN_DIR/bin/install_plugins" ]]; then
  "$TMUX_PLUGIN_DIR/bin/install_plugins"
fi

if ! grep -Fq 'openjdk@21/bin' "$ZPROFILE" 2>/dev/null; then
  {
    echo ""
    echo "# Homebrew OpenJDK 21"
    echo 'export PATH="$(brew --prefix openjdk@21)/bin:$PATH"'
    echo 'export JAVA_HOME="$(/usr/libexec/java_home -v 21 2>/dev/null || brew --prefix openjdk@21)/libexec/openjdk.jdk/Contents/Home"'
  } >> "$ZPROFILE"
fi

mkdir -p "$(dirname -- "$ZSHRC")"
if ! grep -Fq "$TMUX_AUTOSTART" "$ZSHRC" 2>/dev/null; then
  {
    echo ""
    echo "# tmux auto-start"
    echo "source \"$TMUX_AUTOSTART\""
  } >> "$ZSHRC"
fi

mkdir -p "$CONFIG_HOME"
if [[ -L "$NVIM_CONFIG" && "$(readlink "$NVIM_CONFIG")" == "$SCRIPT_DIR/nvim" ]]; then
  :
else
  if [[ -e "$NVIM_CONFIG" || -L "$NVIM_CONFIG" ]]; then
    backup="$NVIM_CONFIG.backup.$(date +%Y%m%d-%H%M%S)"
    mv "$NVIM_CONFIG" "$backup"
    echo "Existing Neovim config moved to: $backup"
  fi
  ln -s "$SCRIPT_DIR/nvim" "$NVIM_CONFIG"
fi

echo "Installing and synchronizing Neovim plugins..."
nvim --headless '+Lazy! sync' +qa

cat <<EOF

Setup complete.

Repository: $SCRIPT_DIR
Neovim config: $NVIM_CONFIG -> $SCRIPT_DIR/nvim
tmux config: $TMUX_CONFIG -> $SCRIPT_DIR/tmux/.tmux.conf

Reload your shell:
  source "$ZPROFILE"

Recommended checks:
  nvim
  :LazyHealth
  :Mason

GitHub CLI authentication, if needed:
  gh auth login
EOF
