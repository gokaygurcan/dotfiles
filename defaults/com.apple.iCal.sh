#!/bin/bash

# show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true

# timezone support
defaults write com.apple.iCal "TimeZone support enabled" -bool true

# restart Calendar
killall Calendar &> /dev/null
