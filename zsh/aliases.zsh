# Command Aliasses
alias git=hub
alias ll='ls -lGa'
alias c='git commit -m'
alias d='git diff --word-diff'
alias l='git lg'
alias p='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias pp='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias s='git status'
alias u='git undo'
alias ck='checkout_branch $1'
alias i='react-native run-ios --simulator "iPhone X"'
alias q='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'  # lock screen
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias virtual='VBoxHeadless -s virtual'
alias cdd='cd ..'
alias e='code'
alias er='e -r .'
alias reload='source ~/.zshrc'

# Folder aliasses
alias dev='cd ~/dev/'

# Alias fuck command
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD && print -s $TF_CMD'
export THEFUCK_REQUIRE_CONFIRMATION='false'


checkout_branch() {
  git checkout $1 2> /dev/null

  if [ $? -eq 0 ]; then
    echo "Switched to an existing branch '$1'"
  else
    echo "Switched to a new branch '$1', branched from '$(git rev-parse --abbrev-ref HEAD)'"
    git checkout -b $1 2> /dev/null
  fi
}
