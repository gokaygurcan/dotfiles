#!/bin/bash

# open with main window
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# show cpu history in the icon
defaults write com.apple.ActivityMonitor IconType -int 6

# show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# sort by cpu usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
