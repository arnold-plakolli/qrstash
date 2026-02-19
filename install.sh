#!/bin/bash

set -e

PREFIX="${PREFIX:-$HOME/.local}"
BIN_DIR="$PREFIX/bin"
COMPLETION_DIR="${COMPLETION_DIR:-$HOME/.zsh/completions}"
DATA_DIR="$HOME/.qrstash"

echo "Installing qrstash..."

# Check for qrencode dependency
if ! command -v qrencode &> /dev/null; then
  echo ""
  echo "Warning: qrencode is not installed."
  echo "Install it with: brew install qrencode"
  echo ""
fi

# Create directories
mkdir -p "$BIN_DIR"
mkdir -p "$COMPLETION_DIR"
mkdir -p "$DATA_DIR"
chmod 700 "$DATA_DIR"

# Install binary
cp bin/qrstash "$BIN_DIR/qrstash"
chmod +x "$BIN_DIR/qrstash"

# Install completions
cp completions/_qrstash "$COMPLETION_DIR/_qrstash"

echo ""
echo "Installed qrstash to $BIN_DIR/qrstash"
echo "Installed completions to $COMPLETION_DIR/_qrstash"
echo ""

# Check if BIN_DIR is in PATH
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  echo "Add the following to your ~/.zshrc:"
  echo ""
  echo "  export PATH=\"$BIN_DIR:\$PATH\""
  echo ""
fi

# Check if COMPLETION_DIR is in fpath
echo "To enable completions, add the following to your ~/.zshrc (before compinit):"
echo ""
echo "  fpath=($COMPLETION_DIR \$fpath)"
echo "  autoload -Uz compinit && compinit"
echo ""
echo "Then restart your shell or run: source ~/.zshrc"
echo ""
echo "Done! Run 'qrstash --help' to get started."
