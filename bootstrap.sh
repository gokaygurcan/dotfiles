#!/bin/bash

# bootstrap.sh
#
# Gokay Gurcan
# https://www.gokaygurcan.com/
# ----------------------------

# Set colors
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Detect OS
if [[ "$OSTYPE" == "linux"* ]]; then
  OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
else
  OS="other"
fi
echo "$RED ~ Detect : $GREEN ${OS} $RESET"

# Continue only if OS is *nix based
if [ $OS == "other" ]; then
  echo "$RED  Exiting.."
  exit 1
else
  echo $BLUE $(uname -a) $RESET
fi

# Create folders if they are missing
if [ ! -d /usr/local/lib/ ]; then
  echo "$RED ~ Create : $GREEN /usr/local/lib $RESET"
  mkdir -p "/usr/local/lib"
fi

if [ ! -d /usr/local/bin/ ]; then
  echo "$RED ~ Create: $GREEN /usr/local/bin $RESET"
  mkdir -p "/usr/local/bin"
fi

# Update package lists
if [ $OS == "linux" ]; then
  echo "$RED ~ Update : $GREEN Packages $RESET"
  sudo apt-get update
fi

# Install dependencies
if [ $OS == "linux" ]; then
  echo "$RED ~ Install : $GREEN Dependencies $RESET"
  sudo apt-get install -y build-essential curl git python-setuptools ruby
fi

# Install Git
if test ! $(which git); then
  echo "$RED ~ Install: $GREEN Git $RESET"
  if [ $OS == "linux" ]; then
    sudo apt-get install git git-core -y
  fi

  echo $BLUE $(git --version) $RESET
fi

# Set some default Git settings
if test ! $(ls $HOME/.gitconfig); then
  git config --global user.name "Gökay Gürcan"
  git config --global user.email "gokaygurcan@gmail.com"
  git config --global github.user "gokaygurcan"
  git config --global color.ui true
  git config --global push.default simple
  git config --global fetch.prune true
  git config --global merge.ff only
  git config --global rebase.autosquash true
fi

# Install Ruby
if test ! $(which ruby); then
  echo "$RED ~ Install: $GREEN Ruby $RESET"

  echo $BLUE $(ruby --version) $RESET
fi

# Install Pip
if test ! $(which pip); then
  echo "$RED ~ Install: $GREEN Pip $RESET"

  if [ $OS == "linux" ]; then
    sudo apt-get -y install python-pip
  elif [ $OS == "macos" ]; then
    sudo easy_install pip
  fi
  
  sudo pip install --upgrade pip

  echo $BLUE $(pip --version) $RESET
fi

# Install Homebrew/Linuxbrew
if test ! $(which brew); then
  if [ $OS == "linux" ]; then
    echo "$RED ~ Install: $GREEN Linuxbrew $RESET"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    PATH="$HOME/.linuxbrew/bin:$PATH"
  elif [ $OS == "macos" ]; then
    echo "$RED ~ Install: $GREEN Homebrew $RESET"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Create .bash_profile
  if ! [ -f $HOME/.bash_profile ]; then
    touch $HOME/.bash_profile
  fi

  # Update .bash_profile
  echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.bash_profile

  # Source .bash_profile file after *brew install
  source $HOME/.bash_profile
fi

# Update brew to the latest
if test $(which brew); then
  echo "$RED ~ Update : $GREEN Brew $RESET"
  brew update

  echo $BLUE $(brew --version) $RESET
fi

# Install n
if test ! $(which n); then
  echo "$RED ~ Install: $GREEN n $RESET"
  brew install n
fi

# Install Node.js
if test ! $(which node); then
  echo "$RED ~ Install: $GREEN Node.js $RESET"
  if [ $OS == "linux" ]; then
    # Claim /usr/local/
    sudo chown $USER:$USER -R /usr/local

    # Installw/o sudo
    n latest
  elif [ $OS == "macos" ]; then
    # Install  w/ sudo
    sudo n latest
  fi

  echo $BLUE $(node --version) $RESET
fi

# Update npm to the latest version
if test $(which npm); then
  echo "$RED ~ Update : $GREEN npm $RESET"
  sudo npm install --global npm

  echo $BLUE $(npm --version) $RESET
fi

# Install Node.js modules
modules1=(
  angcli            # Command-line interface for Angular apps
  ava               # Futuristic test runner
  bower             # The browser package manager
  browser-sync      # Live CSS Reload & Browser Syncing
  browserify        # Browser-side require() the node way
)

modules2=(
  codeceptjs        # Modern Era Aceptance Testing Framework for NodeJS
  commitizen        # Git commit, but play nice with conventions
  coveralls         # Takes json-cov output into stdin and POSTs to coveralls.io
  csslint           # Automated linting of Cascading Stylesheets
  david             # Watching your NodeJS dependencies
)

modules3=(
  express-generator # Express' application generator
  editorconfig-cli  # Initialize .editorconfig in your bash
  eslint            # An AST-based pattern checker for JavaScript
  fast-cli          # Test your download speed using fast.com
  forever           # A simple CLI tool for ensuring that a given node script runs continuously
)

modules4=(
  greenkeeper       # Your software, up to date, all the time
  grunt             # The JavaScript Task Runner
  grunt-cli         # The grunt command line interface
  gulp              # The streaming build system
  horizon           # An open-source developer platform for building realtime, scalable web apps
)

modules5=(
  http-server       # A simple zero-configuration command-line http server
  jscs              # JavaScript Code Style
  jshint            # Static analysis tool for JavaScript
  json              # A 'json' command for massaging and processing JSON on the command line
  json-server       # Serves JSON files through REST routes
)

modules6=(
  localtunnel       # Expose localhost to the world
  lodash-cli        # The Lodash command-line interface
  nativefier        # Wrap web apps natively
  nodemon           # Simple monitor script for use during development of a node.js app
  now               # Realtime global deployments
)

modules7=(
  nsp               # The Node Security (nodesecurity.io) command line interface
  nyc               # A code coverage tool that works well with subprocesses
  pageres-cli       # Capture website screenshots
  pm2               # Production process manager for Node.JS applications with a built-in load balancer
  sassdoc           # A documentation tool for Sass
)

modules8=(
  ts-node           # TypeScript execution environment and REPL for node
  typings           # The TypeScript definition manager
  typescript        # TypeScript is a language for application scale JavaScript development
  v8-profiler       # Node bindings for the v8 profiler
  vue-cli           # A simple CLI for scaffolding Vue.js projects
)

modules9=(
  webdriverio       # A nodejs bindings implementation for selenium 2.0/webdriver
  webpack           # Packs CommonJs/AMD modules for the browser
  xo                # JavaScript happiness style linter
  yarn              # Fast, reliable, and secure dependency management
  yo                # CLI tool for running Yeoman generators
)

echo "$RED ~ Install: $GREEN Node.js modules $RESET"
sudo npm install --global --quiet ${modules1[@]}
sudo npm install --global --quiet ${modules2[@]}
sudo npm install --global --quiet ${modules3[@]}
sudo npm install --global --quiet ${modules4[@]}
sudo npm install --global --quiet ${modules5[@]}
sudo npm install --global --quiet ${modules6[@]}
sudo npm install --global --quiet ${modules7[@]}
sudo npm install --global --quiet ${modules8[@]}
sudo npm install --global --quiet ${modules9[@]}

# Install *brew formulas
formulas1=(
  awscli            # The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services
  coreutils         # GNU core utilities
  git-extras        # GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
  git-flow          # Git extensions to provide high-level repository operations for Vincent Driessen's branching model
  git-lfs           # Git extension for versioning large files
  gource            # Software version control visualization
  neo4j             # The world’s fastest and most scalable graph database
  nmap              # Provide administrators/auditors/hackers with an advanced tool for exploring their networks
  openssl           # Provides a robust, commercial-grade, and full-featured toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols
  phantomjs         # PhantomJS is a headless WebKit scriptable with a JavaScript API
  terminal-notifier # Send User Notifications on Mac OS X 10.8 from the command-line
  tree              # A recursive directory listing command
  unrar             # WinRAR provides the full RAR and ZIP file support
  youtube-dl        # a small command-line program to download videos from YouTube.com and a few more sites
)

formulas2=(
  chromedriver                # WebDriver is an open source tool for automated testing of webapps across many browsers
  geckodriver                 # WebDriver <-> Marionette proxy
  selenium-server-standalone  # Selenium automates browsers
)

echo "$RED ~ Install: $GREEN Brew formulas $RESET"
brew install ${formulas1[@]}
brew install ${formulas2[@]}

if [ $OS == "linux" ]; then
  # Install missing dependencies
  sudo apt-get install libncursesw5 libncursesw5-dev -y

  extraformulas=(
    htop        # An interactive text-mode process viewer for Unix systems
  )
elif [ $OS == "macos" ]; then
  extraformulas=(
    htop-osx    # A port of htop to OSX
    wget        # A free software package for retrieving files
  )
fi

echo "$RED ~ Install: $GREEN OS spesific formulas $RESET"
brew install ${extraformulas[@]}

# Install Ruby Gems
gems=(
  bundler   # The best way to manage a Ruby application's gems
  compass   # Compass is a Sass-based Stylesheet Framework that streamlines the creation and maintenance of CSS
  rake      # A make-like build utility for Ruby
)

echo "$RED ~ Install: $GREEN Ruby gems $RESET"
sudo gem install ${gems[@]}

# Clone .dotfiles repository
if [ ! -d $HOME/.dotfiles ]; then
  git clone https://github.com/gokaygurcan/dotfiles $HOME/.dotfiles --depth=1

  # Get .git-prompt.sh
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

  # Move and source the files
  if [ -d $HOME/.dotfiles ]; then
    FILES=$(ls -A $HOME/.dotfiles/)

    for FILE in $FILES
    do
      echo "$RED ~ Move   : $GREEN $FILE $RESET"
      mv $HOME/.dotfiles/$FILE $HOME/$FILE
      source $HOME/$FILE
    done
  fi
fi
