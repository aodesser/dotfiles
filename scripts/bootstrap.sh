#!/usr/bin/env bash
# Bootstrap script — run once after cloning dotfiles on a fresh machine.
# Usage: bash ~/.dotfiles/scripts/bootstrap.sh

set -e

echo "→ Bootstrapping dotfiles..."

# ── TPM (Tmux Plugin Manager) ─────────────────────────────────────────────────
TPM_DIR="$HOME/.config/tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  echo "→ Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
  echo "→ TPM already installed, skipping."
fi

# Install tmux plugins headlessly (requires tmux to be installed)
if command -v tmux &>/dev/null && [ -d "$TPM_DIR" ]; then
  echo "→ Installing tmux plugins..."
  "$TPM_DIR/bin/install_plugins"
else
  echo "→ Skipping tmux plugins (tmux not running or TPM not found)."
fi

echo ""
echo "✓ Done. You may also run 'Prefix+I' inside tmux to install/update plugins."
