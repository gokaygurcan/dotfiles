#!/bin/bash

# turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
