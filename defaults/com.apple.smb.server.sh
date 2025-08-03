#!/bin/bash

# set computer name
COMPUTER_NAME="gokay.gurcan"
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"
