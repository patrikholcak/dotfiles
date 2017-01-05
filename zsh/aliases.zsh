# Command Aliasses
alias git=hub
alias ll='ls -lGa'
alias l='git lg'
alias d='git diff --word-diff'
alias s='git status'
alias p='show_status -p'
alias server='python -m SimpleHTTPServer'
alias a='atom . && open http://localhost:8080 && npm start'
alias q='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'  # lock screen

# Folder aliasses
alias dev='cd ~/dev/'
alias lab='dev'
alias cdd='cd ..'

# Alias fuck command
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD && print -s $TF_CMD'
export THEFUCK_REQUIRE_CONFIRMATION='false'
