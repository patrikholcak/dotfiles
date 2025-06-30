autoload colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

check_docker() {
  if [ -f /.dockerenv ]; then
      echo "(docker)";
  fi
}

git_prompt() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  git diff --quiet --ignore-submodules HEAD &>/dev/null
  if [[ $? -eq 0 ]]
  then
    echo "$(git_prompt_branch)%{$reset_color%}$(need_push)"
  else
    echo "$(git_prompt_branch)%{$reset_color%}$(need_push)"
  fi
}

git_prompt_branch() {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "%{$fg[cyan]%}@${ref#refs/heads/}%{$reset_color%}"
}

unpushed() {
  $git status --porcelain 2> /dev/null
}

ahead() {
  $git rev-list @{u}.. --count 2> /dev/null
}

need_push() {
  dirty=$(unpushed)
  ah=$(ahead)
  st=""

  if [[ $ah != "0" && $ah != "" ]]; then
    st="[$ah]"
  fi

  if [[ $dirty != "" ]]; then
    st="$st*"
  fi

  echo "%{$fg[cyan]%}%{$st%}%{$reset_color%}"
}

directory_name() {
  if [[ $(pwd) == $HOME ]]; then
    echo "%{$fg_bold[yellow]%}~%{$reset_color%}"
  else
    echo "%{\e[3m%}%{$fg_bold[yellow]%}%1/%{$reset_color%}"
  fi
}

export PROMPT=$'%{$fg[blue]%}$(check_docker)%{$reset_color%}%{$fg[cyan]%}%n:%{$reset_color%}$(directory_name)$(git_prompt)\$ '
