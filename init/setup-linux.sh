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
  $command
  out=$?
  if [ $out -eq 0 ];then
    success "$name"
  else
    fail "Error doing: \"$command\""
  fi
}

getLatestRelease() {
  curl -s https://api.github.com/repos/$1/releases | grep browser_download_url | grep 'amd64' | head -n 1 | cut -d '"' -f 4
}

printf "[ \033[00;33mSystem Apps\033[0m ]\n"
install_package "Apt Update" sudo apt-get update
install_package "Apt Upgrade" sudo apt-get upgrade -y

install_package "Installing Zsh" sudo apt-get install zsh -y
install_package "Installing Python 3" sudo apt-get install python3 -y

install_package "Adding latest Node ppa" curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
install_package "Installing Node" sudo apt-get install -y nodejs
install_package "Aliasing Node" echo "alias node=nodejs" >> ~/.dotfiles/zsh/aliases.zsh

install_package "Downloading hub" wget -qO /tmp/hub-latest.tar $(getLatestRelease "github/hub")
install_package "Unpacking hub" tar -zxf /tmp/hub-latest.tar --xform='s|^|hub-latest/|S' -C /tmp && mv /tmp/hub-latest/**/** /tmp/hub-latest
install_package "Installing hub" sudo prefix=$(echo $HOME)/.dotfiles bash /tmp/hub-latest/install

install_package "Installing flow" npm install flow-bin -g
install_package "Installing vtop" npm install vtop -g

exit 0
