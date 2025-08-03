#!/bin/bash

LANGUAGES=("en-US" "nl-NL")
LOCALE="en_US@currency=eur;rg=nlzzzz"
MEASUREMENT_UNITS="Centimeters"

# set languages
defaults write NSGlobalDomain AppleLanguages -array ${LANGUAGES[@]}

# set locale
defaults write NSGlobalDomain AppleLocale -string "$LOCALE"

# set measurement units
defaults write NSGlobalDomain AppleMeasurementUnits -string "$MEASUREMENT_UNITS"

# like any sane person, use metric units
defaults write NSGlobalDomain AppleMetricUnits -bool true

# disable dash substitution
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# disable period substitution with a double space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# disable quote substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# disable auto capitalise
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# maximize when double click on window's title bar
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"

# use 24-hour clock
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
