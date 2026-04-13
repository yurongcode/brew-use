#!/usr/bin/env bash
# install.sh — Install brew-use via curl
# Usage: curl -fsSL https://raw.githubusercontent.com/yurongcode/brew-use/main/install.sh | bash

set -euo pipefail

BINDIR="${BINDIR:-$HOME/.local/bin}"
REPO="yurongcode/brew-use"
BRANCH="main"
URL="https://raw.githubusercontent.com/$REPO/$BRANCH/bin/brew-use"

echo "Installing brew-use..."

mkdir -p "$BINDIR"
curl -fsSL "$URL" -o "$BINDIR/brew-use"
chmod +x "$BINDIR/brew-use"

# Check if BINDIR is in PATH
if ! echo "$PATH" | tr ':' '\n' | grep -q "^${BINDIR}$"; then
  echo ""
  echo "Note: $BINDIR is not in your PATH."
  echo "Add the following to your shell profile:"
  echo ""
  echo "  export PATH=\"$BINDIR:\$PATH\""
fi

echo ""
echo "✓ brew-use installed to $BINDIR/brew-use"
echo ""
echo "Next step — add this line to your ~/.zshrc or ~/.bashrc:"
echo ""
echo "  eval \"\$(brew-use init)\""
echo ""
echo "Then reload your shell:"
echo ""
echo "  source ~/.zshrc"
