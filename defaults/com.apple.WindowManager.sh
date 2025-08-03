#!/bin/bash

# auto hide window manager, i'm not sure what that is
defaults write com.apple.WindowManager AutoHide -bool true
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool false

# disable show desktop on click, who uses this anyway
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# drag windows to screen edges to tile 
defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool true

# drag windows to menu bar to fill screen
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool true
