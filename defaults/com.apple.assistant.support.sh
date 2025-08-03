#!/bin/bash

# allow explicit content, whatever that might be
defaults write com.apple.assistant.support "Allow Explicit Content" -bool true

# disable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false
defaults write com.apple.assistant.support "Siri Data Sharing Opt-In Status" -bool false

# disable imrpove search in Spotlight 
defaults write com.apple.assistant.support "Assistant Enabled" -bool false
