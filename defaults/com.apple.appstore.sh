#!/bin/bash

# enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true
