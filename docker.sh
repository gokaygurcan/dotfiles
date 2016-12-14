#!/bin/bash

# docker.sh
#
# Gokay Gurcan
# https://www.gokaygurcan.com/
# ----------------------------

set -e

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

# Continue only if OS is linux, macos will follow later.
if [ $OS == "linux" ]; then
  echo $BLUE $(uname -a) $RESET
else
  echo "$RED  Exiting.. $RESET"
  exit 1
fi

echo "$RED ~ Install : $GREEN Packages and libraries $RESET"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https ca-certificates linux-image-extra-$(uname -r) linux-image-extra-virtual linux-image-generic-lts-xenial

echo "$RED ~ Install : $GREEN Docker $RESET"
sudo wget -qO- https://get.docker.com/ | sh

echo "$RED ~ Configuration : $GREEN Add user to the Docker group $RESET"
sudo usermod -aG docker $(whoami)

echo "$RED ~ Service : $GREEN Start Docker service $RESET"
sudo service docker start

echo "$RED ~ Install : $GREEN Docker Compose $RESET"
sudo apt-get -y install python-pip
sudo pip install --upgrade pip
sudo pip install docker-compose
