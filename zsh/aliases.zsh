# Command Aliasses
alias git=hub
alias ll='ls -lGa'
alias l='git lg'
alias d='git diff --word-diff'
alias s='git status'
alias p='show_status -p'
alias pp='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias e='code'
alias a='code . && npm start'
alias i='react-native run-ios'
alias q='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'  # lock screen
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias cdd='cd ..'

# Folder aliasses
alias dev='cd ~/dev/'

# Alias fuck command
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD && print -s $TF_CMD'
export THEFUCK_REQUIRE_CONFIRMATION='false'
