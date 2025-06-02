#!/bin/bash
# Catppuccin Terminal Setup Script
# This script sets up Catppuccin Mocha theme for your terminal environment

set -e

echo "🌸 Setting up Catppuccin Mocha theme for your terminal..."
echo ""

# Source the color palette
source ~/.config/catppuccin/mocha.sh

# Apply Git colors
echo "📝 Configuring Git colors..."
source ~/.config/catppuccin/git.sh

# Apply FZF colors
echo "🔍 Configuring FZF colors..."
source ~/.config/catppuccin/fzf.sh

echo ""
echo "✨ Catppuccin Mocha theme setup complete!"
echo ""
echo "🎨 To see the color palette, run: catppuccin_show"
echo "📁 Your ls/lsd commands now use Catppuccin colors"
echo "🔍 FZF (Ctrl+R) now uses Catppuccin colors"
echo "📝 Git output now uses Catppuccin colors"
echo ""
echo "💡 For Warp terminal, you can manually set the theme to Catppuccin in:"
echo "   Settings → Appearance → Themes → Catppuccin Mocha"
echo ""
echo "🔄 To apply these changes permanently, add this to your ~/.zshrc:"
echo "   source ~/.config/catppuccin/mocha.sh"
echo "   source ~/.config/catppuccin/fzf.sh"
echo ""

