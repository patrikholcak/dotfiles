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

  printf "[ \033[00;33mSystem Apps\033[0m ]\n"
install_package "Homebrew Update" brew update
install_package "Homebrew Upgrade" brew upgrade

install_package "Installing Zsh" brew install zsh
install_package "Installing Node" brew install node
install_package "Installing Python 3" brew install python3
install_package "Installing hub" brew install hub

install_package "Installing flow" npm install flow-bin -g

install_package "Homebrew Cask" brew install caskroom/cask/brew-cask

install_package "Installing app Sublime Text 3" brew cask install sublime-text3 2> /dev/null
install_package "Installing app Chrome" brew cask install google-chrome 2> /dev/null
install_package "Installing app Chrome Canary" brew cask install google-chrome-canary 2> /dev/null
install_package "Installing app Firefox" brew cask install firefox 2> /dev/null
install_package "Installing app Firefox Nightly" brew cask install firefox-nightly 2> /dev/null

install_package "Installing app Audacity" brew cask install audacity 2> /dev/null
install_package "Installing app Battle.net" brew cask install battle-net 2> /dev/null
install_package "Installing app The Unarchiver" brew cask install the-unarchiver 2> /dev/null
install_package "Installing app VirtualBox" brew cask install virtualbox 2> /dev/null
install_package "Installing app Slack" brew cask install slack 2> /dev/null
install_package "Installing app Transmission" brew cask install transmission 2> /dev/null
install_package "Installing app ImageOptim" brew cask install imageoptim 2> /dev/null
install_package "Installing app AppCleaner" brew cask install appcleaner 2> /dev/null
install_package "Installing app Atom" brew cask install atom 2> /dev/null
install_package "Installing app Dropbox" brew cask install dropbox 2> /dev/null
install_package "Installing app Skype" brew cask install skype 2> /dev/null
install_package "Installing app Cloak" brew cask install cloak 2> /dev/null
install_package "Installing app betterzipql" brew cask install betterzipql 2> /dev/null
install_package "Installing app qlstephen" brew cask install qlstephen 2> /dev/null
install_package "Installing app quicklook-json" brew cask install quicklook-json 2> /dev/null

install_package "Cleanup" brew cleanup

exit 0
