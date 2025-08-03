#!/bin/bash

# change default window to pro
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# disable line marks
defaults write com.apple.Terminal ShowLineMarks -int 0
