#!/bin/bash

# show these items on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# new finder window shows
# "PfVo": Main volume / Machintosh HD
# "PfAF": App my files
# "PfCm": Computer
# "PfHm": Home
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# use tabs instead of windows
defaults write com.apple.finder FinderSpawnTab -bool true

# enable sidebar
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder SidebarWidth -int 190

# enable favorites, locations, icloud and tags
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebariCloudDriveSectionDisclosedState -bool true
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarTagsSctionDisclosedState -bool false
defaults write com.apple.finder ShowRecentTags -bool true
defaults write com.apple.finder SidebarShowingSignedIntoiCloud -bool true
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false

# show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# search the current folder
# "SCev": this mac
# "SCcf": current folder
# "SCsp": previous search scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# show items as icons
# "icnv": icons
# "Nlsv": list
# "clmv": column
# "Flwv": galery
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"

# sort by name
# Name, Kind, Application, ...
defaults write com.apple.finder FXArrangeGroupViewBy -string "Name"

# sort folders first
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# add quit menu item
defaults write com.apple.finder QuitMenuItem -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# restart Finder
# killall Finder &> /dev/null
