# Antigen
source "$HOME/antigen.zsh"

if which antigen &> /dev/null; then
  antigen use oh-my-zsh
  antigen bundle git
  antigen bundle heroku
  antigen bundle command-not-found
  antigen bundle zsh-users/zsh-history-substring-search
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle psprint/history-search-multi-word
  antigen bundle "greymd/docker-zsh-completion"

  antigen theme mgee/slimline

  antigen apply
 
  # https://github.com/zdharma/history-search-multi-word/
  zstyle ":history-search-multi-word" page-size "8"
  zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold" 
  zstyle ":plugin:history-search-multi-word" synhl "yes"   
  zstyle ":plugin:history-search-multi-word" active "underline"   
  zstyle ":plugin:history-search-multi-word" check-paths "yes"  
  zstyle ":plugin:history-search-multi-word" clear-on-cancel "no" 
  
  # https://github.com/zsh-users/zsh-history-substring-search
  bindkey -e
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward

fi

# .profile
source $HOME/.profile
