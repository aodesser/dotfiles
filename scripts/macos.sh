#!/usr/bin/env bash
# macOS system defaults
# Run once after a fresh install: bash ~/.dotfiles/scripts/macos.sh

echo "Applying macOS defaults..."

# ── Finder ────────────────────────────────────────────────────────────────────
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Keep folders on top when sorting
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Disable .DS_Store on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# ── Keyboard ──────────────────────────────────────────────────────────────────
# Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes and quotes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# ── Dock ──────────────────────────────────────────────────────────────────────
# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true
# Remove auto-hide delay
defaults write com.apple.dock autohide-delay -float 0
# Speed up hide/show animation
defaults write com.apple.dock autohide-time-modifier -float 0.3
# Don't show recent apps in Dock
defaults write com.apple.dock show-recents -bool false
# Icon size
defaults write com.apple.dock tilesize -int 48

# ── Screenshots ───────────────────────────────────────────────────────────────
# Save to ~/Desktop/Screenshots
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture location -string "~/Desktop/Screenshots"
# Remove shadow from screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# Save as PNG
defaults write com.apple.screencapture type -string "png"

# ── Trackpad ──────────────────────────────────────────────────────────────────
# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ── Misc ──────────────────────────────────────────────────────────────────────
# Expand save and print dialogs by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# Quit printer app when done
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# ── Apply ─────────────────────────────────────────────────────────────────────
killall Finder Dock 2>/dev/null

echo "Done. Some changes may require a logout to take effect."
