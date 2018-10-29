#!/bin/sh

info() {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user() {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

install_package() {
  name=$1
  shift
  info "$name"
  command=$@
  $command > /dev/null 2>&1
  out=$?
  if [ $out -eq 0 ];then
    success "$name"
  else
    fail "Error doing: \"$command\""
  fi
}

printf "[ \033[00;33mSystem\033[0m ]\n"
install_package "Setting up defaults\n" init/set-defaults-osx.sh

printf "[ \033[00;33mSystem Apps\033[0m ]\n"
install_package "Homebrew Update" brew update
install_package "Homebrew Upgrade" brew upgrade

install_package "Installing Zsh" brew install zsh
install_package "Installing Node" brew install node
install_package "Installing Python 3" brew install python3
install_package "Installing hub" brew install hub
install_package "Installing MAS" brew install mas

install_package "Installing flow" npm install flow-bin -g

install_package "Homebrew Cask" brew tap caskroom/cask
install_package "Homebrew Cask" brew tap caskroom/versions

# Install required packages
install_package "Installing app Chrome Canary" brew cask install google-chrome-canary 2> /dev/null
install_package "Installing app VS Code" brew cask install visual-studio-code 2> /dev/null
install_package "Installing app 1Password" brew cask install 1password 2> /dev/null
install_package "Installing app Slack" brew cask install slack-beta 2> /dev/null
install_package "Installing app Docker" brew cask install docker 2> /dev/null
install_package "Installing app Sketch" brew cask install sketch 2> /dev/null
install_package "Installing app VirtualBox" brew cask install virtualbox 2> /dev/null

install_package "Installing app betterzipql" brew cask install betterzipql 2> /dev/null
install_package "Installing app qlstephen" brew cask install qlstephen 2> /dev/null
install_package "Installing app quicklook-json" brew cask install quicklook-json 2> /dev/null

install_package "Installing app The Unarchiver" brew cask install the-unarchiver 2> /dev/null
install_package "Installing app Zoom.us" brew cask install zoomus 2> /dev/null

# Additional editors & browsers
install_package "Installing app Sublime Text" brew cask install sublime-text 2> /dev/null
install_package "Installing app Atom" brew cask install atom 2> /dev/null
install_package "Installing app Chrome" brew cask install google-chrome 2> /dev/null
install_package "Installing app Firefox" brew cask install firefox 2> /dev/null
install_package "Installing app Opera" brew cask install opera 2> /dev/null

# Additional software
install_package "Installing app CleanMyMac" brew cask install cleanmymac3 2> /dev/null
install_package "Installing app Audacity" brew cask install audacity 2> /dev/null
install_package "Installing app Dropbox" brew cask install dropbox 2> /dev/null
install_package "Installing app ImageOptim" brew cask install imageoptim 2> /dev/null
install_package "Installing app ImageAlpha" brew cask install imagealpha 2> /dev/null
install_package "Installing app Skype" brew cask install skype 2> /dev/null

install_package "Installing app Giphy Capture" mas install 668208984
install_package "Installing app Battery Indicator" mas install 1206020918
install_package "Installing app Xcode" mas install 497799835

install_package "Cleanup" brew cleanup

exit 0
