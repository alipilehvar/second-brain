#!/bin/bash
# Second Brain X — Plugin Installer
# Installs the `setup-brain` command globally in Claude Code
# Usage: curl -fsSL https://raw.githubusercontent.com/alipilehvar/second-brain/main/install.sh | bash

set -e

COMMANDS_DIR="$HOME/.claude/commands"
PLUGIN_URL="https://raw.githubusercontent.com/alipilehvar/second-brain/main/plugin/setup-brain.md"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Second Brain X — Installing Plugin"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Create commands directory if it doesn't exist
mkdir -p "$COMMANDS_DIR"

# Download the setup-brain command
echo "→ Downloading setup-brain command..."
curl -fsSL "$PLUGIN_URL" -o "$COMMANDS_DIR/setup-brain.md"

echo "→ Installed to: $COMMANDS_DIR/setup-brain.md"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✅ Plugin installed successfully!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo ""
echo "  1. Install Obsidian:   https://obsidian.md"
echo "  2. Install Granola:    https://granola.so"
echo "  3. Create your vault folder:"
echo "       mkdir ~/Desktop/MyBrain && cd ~/Desktop/MyBrain"
echo "  4. Open Claude Code:"
echo "       claude"
echo "  5. Type:  setup-brain"
echo ""
echo "Claude will ask you 10 questions and build your entire"
echo "second brain in ~5 minutes. No technical knowledge needed."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
