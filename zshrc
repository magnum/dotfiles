# Antigen
source "$HOME/antigen.zsh"

if which antigen &> /dev/null; then
  antigen use oh-my-zsh
  antigen bundle git
  antigen bundle heroku
  antigen bundle command-not-found
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle psprint/history-search-multi-word
  antigen theme mgee/slimline
  antigen apply
 
  bindkey -e
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
fi



# .profile
source $HOME/.profile
