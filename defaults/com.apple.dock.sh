#!/bin/bash

# enable auto hide
defaults write com.apple.dock autohide -bool true

# group windows by application
defaults write com.apple.dock expose-group-apps -bool true

# animate opening applications
defaults write com.apple.dock launchanim -bool false

# show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# hide recent applications
defaults write com.apple.dock show-recents -bool false

# show only active applications
defaults write com.apple.dock static-only -bool false

# clear recent applications
defaults write com.apple.dock recent-apps -array

# clear persistent applications (we'll add them later)
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

# dock size
defaults write com.apple.dock tilesize -float 64

# lock size
defaults write com.apple.Dock size-immutable -bool true

# dock orientation
defaults write com.apple.dock orientation -string bottom

# hot corners
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# --
# 0      : no modifier
# 524288 : option
# 1048576: command
# 1573864: option + command
defaults write com.apple.dock wvous-bl-corner -int 3;   # application windows
defaults write com.apple.dock wvous-bl-modifier -int 0; # no modifier
defaults write com.apple.dock wvous-br-corner -int 4;   # desktop
defaults write com.apple.dock wvous-br-modifier -int 0; # no modifier
defaults write com.apple.dock wvous-tl-corner -int 2;   # mission control
defaults write com.apple.dock wvous-tl-modifier -int 0; # no modifier
defaults write com.apple.dock wvous-tr-corner -int 12;  # notification center
defaults write com.apple.dock wvous-tr-modifier -int 0; # no modifier

# restart Dock
killall Dock &> /dev/null
