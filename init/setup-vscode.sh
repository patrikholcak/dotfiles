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

printf "[ \033[00;33mCopying preferences\033[0m ]\n"
cp -r configs/Code ~/Library/Application\ Support/


printf "[ \033[00;33mInstalling Extensions\033[0m ]\n"

install_package "coenraads.bracket-pair-colorizer-2\n" code --install-extension coenraads.bracket-pair-colorizer-2
install_package "naumovs.color-highlight\n" code --install-extension naumovs.color-highlight
install_package "dbaeumer.vscode-eslint\n" code --install-extension dbaeumer.vscode-eslint
install_package "kumar-harsh.graphql-for-vscode\n" code --install-extension kumar-harsh.graphql-for-vscode
install_package "wix.vscode-import-cost\n" code --install-extension wix.vscode-import-cost
install_package "orta.vscode-jest\n" code --install-extension orta.vscode-jest
install_package "silvenon.mdx\n" code --install-extension silvenon.mdx
install_package "monokai.theme-monokai-pro-vscode\n" code --install-extension monokai.theme-monokai-pro-vscode
install_package "christian-kohler.npm-intellisense\n" code --install-extension christian-kohler.npm-intellisense
install_package "christian-kohler.path-intellisense\n" code --install-extension christian-kohler.path-intellisense
install_package "ricard.postcss\n" code --install-extension ricard.postcss
install_package "esbenp.prettier-vscode\n" code --install-extension esbenp.prettier-vscode
install_package "visualstudioexptteam.vscodeintellicode\n" code --install-extension visualstudioexptteam.vscodeintellicode
