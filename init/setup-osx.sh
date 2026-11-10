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
install_package "Installing hub" brew install hub
install_package "Installing gh" brew install gh
install_package "Installing MAS" brew install mas
install_package "Installing Orbstack" brew install orbstack

install_package "Installing app Sublime Text" brew install --cask sublime-text 2> /dev/null
install_package "Installing app 1Password" brew install --cask 1password 2> /dev/null
install_package "Installing app VS Code" brew install --cask visual-studio-code 2> /dev/null
install_package "Installing app Brave" brew install --cask brave-browser 2> /dev/null
install_package "Installing app Slack" brew install --cask slack 2> /dev/null
install_package "Installing app Figma" brew install --cask figma 2> /dev/null

# Additional software
install_package "Installing app The Unarchiver" brew install --cask the-unarchiver 2> /dev/null
install_package "Installing app Mimestream" brew install --cask mimestream 2> /dev/null
install_package "Installing app CleanMyMac" brew install --cask cleanmymac 2> /dev/null
install_package "Installing app ImageOptim" brew install --cask imageoptim 2> /dev/null

# App store apps
install_package "Installing app Dato" mas install 1470584107
install_package "Installing app Pandan" mas install 1569600264
install_package "Installing app Xcode" mas install 497799835

# Android deps for RN
install_package "Installing Temurin" brew install --cask temurin@17
install_package "Installing Android CLI" brew install --cask android-cli

install_package "Cleanup" brew cleanup

exit 0
