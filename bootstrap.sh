#!/bin/bash

set -ex

DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# print what shell is currently running
echo "[setup] shell: $($SHELL --version)"

# check if use has sudo access, exit otherwise
if ! sudo -v &> /dev/null; then
  echo "[setup] sudo access will be needed later in this process. exiting."
  exit 1
fi

# keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# set and check OS variables
NAME=$(uname -s) # --kernel-name
VERSION=$(uname -v) # --kernel-version

# update
echo "[setup] update and upgrade"
if [[ $NAME == "Darwin"* && $VERSION == *"Darwin"* ]]; then
  # software updates and agreements
  sudo softwareupdate &>/dev/null || sudo softwareupdate --install --all --agree-to-license --verbose
  sudo xcode-select -p &>/dev/null || sudo xcode-select --install
elif [[ $NAME == "Linux"* && $VERSION == *"Ubuntu"* ]]; then
  # update package sources
  sudo apt-get update -qq && \
  # upgrade packages
  sudo apt-get upgrade -yqq && \
  sudo apt-get dist-upgrade -yqq
  # install packages
  echo "[setup] install required packages"
  sudo apt-get install -yqq --no-install-recommends --no-install-suggests \
  build-essential \
  ca-certificates \
  procps \
  curl \
  file \
  git
fi

if [[ $NAME == "Darwin"* && $VERSION == *"Darwin"* ]]; then
  # add touch id support for sudo
  if [ ! -f /etc/pam.d/sudo_local ]; then
    echo "[setup] enabling Touch ID for sudo"
    sed 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local > /dev/null
  fi
fi

# install/update oh-my-zsh
if [[ -d ~/.oh-my-zsh ]]; then
  echo "[setup] \`oh-my-zsh\` installed, skipping."
else
  echo "[setup] installing \`oh-my-zsh\`."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install brew
if which brew &> /dev/null; then
  echo "[setup] \`brew\` installed, skipping."
else
  echo "[setup] installing \`brew\`."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ $NAME == "Linux"* && $VERSION == *"Ubuntu"* ]]; then
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# export brew paths
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/sbin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# brew update/upgrade
brew update
brew upgrade
brew upgrade --cask

# brew bundle
echo "[setup] installing \`brew\` formulae and casks."
brew bundle

if [[ $NAME == "Darwin"* && $VERSION == *"Darwin"* ]]; then
  # reload quicklook list
  qlmanage -r
fi

# cleanup
brew cleanup

if [[ $NAME == "Darwin"* && $VERSION == *"Darwin"* ]]; then
  # now that we have xcode, let's also install xcodebuild
  sudo xcodebuild &>/dev/null || sudo xcodebuild -license -verbose
fi

if [[ $NAME == "Darwin"* && $VERSION == *"Darwin"* ]]; then
  mkdir ~/.nvm

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  # install node (lts)
  nvm install --lts
fi

# clone repository
echo "[setup] cloning dotfiles repository"
git clone https://github.com/gokaygurcan/dotfiles.git dotfiles
cd dotfiles

# move dotfiles
echo "[setup] setting up dotfiles"
cp -r dotfiles/.git-configs ~/
cp -r dotfiles/.zsh-personal ~/
cp dotfiles/.editorconfig ~/
cp dotfiles/.gitattributes ~/
cp dotfiles/.gitconfig ~/
cp dotfiles/.gitignore_global ~/
cp dotfiles/.npmrc ~/
cp dotfiles/.nvmrc ~/

if [[ $NAME == "Darwin"* && $VERSION == *"Darwin"* ]]; then
  cp dotfiles/config.json ~/Library/Application\ Support/Leader\ Key
fi

# update zsh configs
# install powerline fonts
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   git clone https://github.com/powerline/fonts.git --depth=1
#   zsh fonts/install.sh
#   rm -rf fonts
# elif [[ "$OSTYPE" == "linux"* ]]; then
#   sudo apt-get install fonts-powerline
# fi

# change zsh theme (it requires powerline fonts)
# sed -i'' -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# change timestamp format
sed -i'' -e 's/# HIST_STAMPS="mm\/dd\/yyyy"/HIST_STAMPS="yyyy-mm-dd"/g' ~/.zshrc

# add plugins
sed -i'' -e 's/plugins=(git)/plugins=(1password brew bun common-aliases deno docker docker-compose dotenv git git-extras git-lfs git-prompt github gitignore history jsontools macos macports nmap node npm nvm ssh ssh-agent tmux vscode sudo)/g' ~/.zshrc

# source personal zsh files
tee -a ~/.zshrc << END

# source personal zsh files
for file in ~/.zsh-personal/.zsh-{aliases,functions,variables}; do
  if [[ -f "\$file" ]]; then
    source "\$file"
  fi
done
END

# apply macos defaults
if [[ $NAME == "Darwin"* && $VERSION == *"Darwin"* ]]; then
  echo "[setup] applying macOS system defaults"

  # quit system preferences
  osascript -e 'tell application "System Preferences" to quit'

  # recursively source all .sh files in the directory
  find "./defaults" -type f -name "*.sh" | while read -r script; do
    echo "[setup] sourcing $script"

    source "$script"
  done

  # activate settings
  /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

  # backup folder
  cp -r defaults ~/.zsh-personal/
fi
