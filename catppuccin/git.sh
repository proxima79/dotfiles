#!/bin/bash
# Catppuccin Mocha theme for Git
# Usage: source ~/.config/catppuccin/git.sh

# Configure git colors with Catppuccin Mocha palette
git config --global color.ui true

# Branch colors
git config --global color.branch.current "#cba6f7"      # Mauve
git config --global color.branch.local "#89b4fa"        # Blue  
git config --global color.branch.remote "#a6e3a1"       # Green

# Diff colors
git config --global color.diff.meta "#f9e2af"          # Yellow
git config --global color.diff.frag "#89b4fa"          # Blue
git config --global color.diff.old "#f38ba8"           # Red
git config --global color.diff.new "#a6e3a1"           # Green

# Status colors
git config --global color.status.added "#a6e3a1"       # Green
git config --global color.status.changed "#f9e2af"     # Yellow
git config --global color.status.untracked "#f38ba8"   # Red
git config --global color.status.branch "#cba6f7"      # Mauve
git config --global color.status.nobranch "#f38ba8"    # Red

# Interactive colors
git config --global color.interactive.prompt "#cba6f7" # Mauve
git config --global color.interactive.header "#89b4fa" # Blue
git config --global color.interactive.help "#a6adc8"   # Subtext0
git config --global color.interactive.error "#f38ba8"  # Red

echo "✅ Git configured with Catppuccin Mocha colors"

