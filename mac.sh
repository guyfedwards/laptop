#!/bin/sh

# Script for setting up new mac
# Let the games begin

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

# Resets the style
reset=`tput sgr0`

# Color-echo. Credit @brandonb927
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

# Homebrew shiznit
# Apps
apps=(
  1password
  appcleaner
  alfred
  dropbox
  divvy
  evernote
  google-chrome
  karabiner
  slack
  seil
  spotify
  skype
  the-unarchiver
  transmit
  transmission
  tunnelblick
  vagrant
  virtualbox
  vlc
)

fonts=(
  font-meslo-lg-for-powerline
)

scripts=(

)

npm=(

)

# Specify the location of the apps
appdir="/Applications"

cecho "Install App Store Apps first!!" $red
read -p "Press any key to continue..." -n1 -s
echo "\n"

# Check for Homebrew
if test ! $(which brew); then
  cecho "Installing homebrew..." $red
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew update
fi

# Install GNU core utilities (OS X ones are out of date)
cecho "installing coreutils" $yellow
brew install coreutils
cecho "coreutils done" $green

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install bash 4
brew install bash

# Update vim
brew install vim

# Tmux
brew install tmux

# Ag/Silver_searcher
brew install the_silver_searcher

# Update grep
cecho "updating grep" $yellow
brew tap homebrew/dupes
brew install homebrew/dupes/grep
cecho "grep updated" $green

# Install homebrew-cask
cecho "installing cask..." $yellow
brew tap phinze/homebrew-cask
brew install brew-cask

# Tap the fonts
brew tap caskroom/fonts
cecho "cask done" $green

# install apps
cecho "installing apps..." $yellow
brew cask install --appdir=$appdir ${apps[@]}
cecho "apps done" $green

# install fonts
cecho "installing fonts..." $yellow
brew cask install ${fonts[@]}
cecho "fonts done" $green

# Node
brew install node

# install node modules
cecho "installing node modules" $yellow
sudo npm install -g ${npm[@]}
cecho "node modules done" $green

# link with alfred
brew cask alfred link

# cleanup
brew cleanup



