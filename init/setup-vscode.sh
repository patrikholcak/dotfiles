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

install_package "angryobject.react-pure-to-class-vscode\n" code --install-extension angryobject.react-pure-to-class-vscode
install_package "burkeholland.simple-react-snippets\n" code --install-extension burkeholland.simple-react-snippets
install_package "capaj.vscode-exports-autocomplete\n" code --install-extension capaj.vscode-exports-autocomplete
install_package "christian-kohler.npm-intellisense\n" code --install-extension christian-kohler.npm-intellisense
install_package "christian-kohler.path-intellisense\n" code --install-extension christian-kohler.path-intellisense
install_package "coenraads.bracket-pair-colorizer-2\n" code --install-extension coenraads.bracket-pair-colorizer-2
install_package "dbaeumer.vscode-eslint\n" code --install-extension dbaeumer.vscode-eslint
install_package "dzannotti.vscode-babel-coloring\n" code --install-extension dzannotti.vscode-babel-coloring
install_package "esbenp.prettier-vscode\n" code --install-extension esbenp.prettier-vscode
install_package "flowtype.flow-for-vscode\n" code --install-extension flowtype.flow-for-vscode
install_package "formulahendry.auto-rename-tag\n" code --install-extension formulahendry.auto-rename-tag
install_package "monokai.theme-monokai-pro-vscode\n" code --install-extension monokai.theme-monokai-pro-vscode
install_package "ms-vscode.sublime-keybindings\n" code --install-extension ms-vscode.sublime-keybindings
install_package "ms-vscode.typescript-javascript-grammar\n" code --install-extension ms-vscode.typescript-javascript-grammar
install_package "naumovs.color-highlight\n" code --install-extension naumovs.color-highlight
install_package "orta.vscode-jest\n" code --install-extension orta.vscode-jest
install_package "qinjia.seti-icons\n" code --install-extension qinjia.seti-icons
install_package "ricard.postcss\n" code --install-extension ricard.postcss
install_package "shinnn.stylelint\n" code --install-extension shinnn.stylelint
install_package "sirtori.indenticator\n" code --install-extension sirtori.indenticator
install_package "smockle.xcode-default-theme\n" code --install-extension smockle.xcode-default-theme
install_package "sysoev.language-stylus\n" code --install-extension sysoev.language-stylus
install_package "wix.vscode-import-cost\n" code --install-extension wix.vscode-import-cost
install_package "Zignd.html-css-class-completion\n" code --install-extension Zignd.html-css-class-completion
