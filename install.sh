#!/usr/bin/env bash
# install.sh · Target Investigation Skill Installer (Mac/Linux)
# Usage: bash install.sh [TRAE|CURSOR|CLAUDE|CLINE|ALL]

set -e
TARGET="${1:-ALL}"
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
SKILL_NAME="target-investigation"

echo ""
echo "========== Target Investigation Skill Installer =========="
echo ""

# 1. TRAE
install_trae() {
    local SKILL_DIR="$REPO_ROOT/platforms/trae"
    local GLOBAL_DIR="$HOME/.trae-cn/skills/$SKILL_NAME"
    mkdir -p "$GLOBAL_DIR"
    cp -r "$SKILL_DIR"/* "$GLOBAL_DIR/"
    if [ -d "$REPO_ROOT/domains" ]; then
        cp -r "$REPO_ROOT/domains" "$GLOBAL_DIR/"
    fi
    echo "  ✅ TRAE global skill → $GLOBAL_DIR"
}

# 2. Cursor
install_cursor() {
    local CURSOR_FILE="$REPO_ROOT/platforms/cursor/target-investigation.mdc"
    local GLOBAL_DIR="$HOME/.cursor/rules"
    local DOMAINS_DIR="$GLOBAL_DIR/target-investigation-domains"
    mkdir -p "$GLOBAL_DIR" "$DOMAINS_DIR"
    cp "$CURSOR_FILE" "$GLOBAL_DIR/"
    cp "$REPO_ROOT/domains/"*.md "$DOMAINS_DIR/" 2>/dev/null || true
    echo "  ✅ Cursor rule → $GLOBAL_DIR/target-investigation.mdc"
}

# 3. Claude Desktop
install_claude() {
    local CLAUDE_FILE="$REPO_ROOT/platforms/claude-desktop/CLAUDE.md"
    local TARGET="$HOME/CLAUDE.md"
    if [ -f "$TARGET" ]; then
        echo "  ⚠️  ~/CLAUDE.md exists — appending skill content"
        echo "" >> "$TARGET"
        echo "---" >> "$TARGET"
        cat "$CLAUDE_FILE" >> "$TARGET"
        echo "  ✅ Appended to → $TARGET"
    else
        cp "$CLAUDE_FILE" "$TARGET"
        echo "  ✅ CLAUDE.md → $TARGET"
    fi
}

# 4. Cline
install_cline() {
    local CLINE_FILE="$REPO_ROOT/platforms/cline/target-investigation.md"
    local GLOBAL_DIR="$HOME/.cline/custom-prompts"
    mkdir -p "$GLOBAL_DIR"
    cp "$CLINE_FILE" "$GLOBAL_DIR/"
    if [ -d "$REPO_ROOT/domains" ]; then
        cp -r "$REPO_ROOT/domains" "$GLOBAL_DIR/"
    fi
    echo "  ✅ Cline custom prompt → $GLOBAL_DIR"
}

case "$TARGET" in
    TRAE)      echo "Installing for TRAE..."; install_trae ;;
    CURSOR)    echo "Installing for Cursor..."; install_cursor ;;
    CLAUDE)    echo "Installing for Claude Desktop..."; install_claude ;;
    CLINE)     echo "Installing for Cline..."; install_cline ;;
    ALL)
        echo "Installing for ALL platforms..."
        install_trae
        install_cursor
        install_claude
        install_cline
        ;;
    *)
        echo "Usage: bash install.sh [TRAE|CURSOR|CLAUDE|CLINE|ALL]"
        exit 1
        ;;
esac

echo ""
echo "🎉 Done! Restart your agent to load the skill."
echo ""
