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

install_extension() {
  name=$1
  shift
  info "$name"
  command=$@
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension $command > /dev/null 2>&1
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

install_extension "coenraads.bracket-pair-colorizer-2\n" coenraads.bracket-pair-colorizer-2
install_extension "naumovs.color-highlight\n" naumovs.color-highlight
install_extension "dbaeumer.vscode-eslint\n" dbaeumer.vscode-eslint
install_extension "kumar-harsh.graphql-for-vscode\n" kumar-harsh.graphql-for-vscode
install_extension "wix.vscode-import-cost\n" wix.vscode-import-cost
install_extension "orta.vscode-jest\n" orta.vscode-jest
install_extension "silvenon.mdx\n" silvenon.mdx
install_extension "monokai.theme-monokai-pro-vscode\n" monokai.theme-monokai-pro-vscode
install_extension "christian-kohler.npm-intellisense\n" christian-kohler.npm-intellisense
install_extension "christian-kohler.path-intellisense\n" christian-kohler.path-intellisense
install_extension "ricard.postcss\n" ricard.postcss
install_extension "esbenp.prettier-vscode\n" esbenp.prettier-vscode
install_extension "visualstudioexptteam.vscodeintellicode\n" visualstudioexptteam.vscodeintellicode
