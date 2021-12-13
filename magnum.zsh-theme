
# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

function git_custom_info() {

  info_prefix=""
   
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    info_prefix=%{$fg[red]%}
  else
    info_prefix=%{$fg[green]%}
  fi



  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    INFO="${info_prefix}${ref#refs/heads/}"
  fi

  echo " $INFO"
}


function docker_custom_info() {
        DOCKER_CUSTOM_INFO="";
        if [[ -v DOCKER_MACHINE_NAME ]]; then
                DOCKER_CUSTOM_INFO=" 🐳 $DOCKER_MACHINE_NAME ";
        fi
        echo "$DOCKER_CUSTOM_INFO";
}



PROMPT='%{$terminfo[bold]$fg[blue]%}%{$reset_color%}\
%{$terminfo[bold]$fg[white]%}${current_dir}%{$reset_color%}\
%{$fg[white]%}%~%{$fg_bold[blue]%}$(git_custom_info)%{$reset_color%}$(docker_custom_info)%{$fg[white]%}$ %{$reset_color%}'

# disabled
#%{$fg[white]%}:
#%{$fg[reset_color]%}%n\
#%{$fg[reset_color]%}@\
#%{$fg[reset_color]%}$(box_name)\

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
