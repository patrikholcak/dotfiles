# Command Aliasses
alias ll='ls -lGa'
alias l='git lg'
alias d='git diff'
alias s='git status'
alias p='show_status -p'
alias server='python -m SimpleHTTPServer'
alias a='atom . && open http://localhost:8080 && npm start'
alias q='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'  # lock screen

# Folder aliasses
alias dev='cd ~/dev/'
alias lab='cd ~/dev/_labs/'
alias cdd='cd ..'

# Alias fuck command
eval $(thefuck --alias)
export THEFUCK_REQUIRE_CONFIRMATION='false'
