# powerleven9k prompt
# https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# Antigen
source "$HOME/antigen.zsh"

#if false; then
if which antigen &> /dev/null; then
  antigen use oh-my-zsh
  antigen bundle git
  # antigen bundle heroku
  antigen bundle command-not-found
  #antigen bundle zsh-users/zsh-history-substring-search
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle psprint/history-search-multi-word
  antigen bundle "greymd/docker-zsh-completion"
  antigen bundle zsh-users/zsh-completions
  antigen bundle voronkovich/gitignore.plugin.zsh
  
  # pure theme	
  #antigen bundle mafredri/zsh-async  
  #antigen bundle sindresorhus/pure
  
  antigen theme robbyrussell/oh-my-zsh themes/magnum
  #antigen theme bhilburn/powerlevel9k powerlevel9k
  #antigen theme robbyrussell/oh-my-zsh themes/simple   
  #antigen theme mgee/slimline
  #antigen theme spaceship
  #antigen theme sindresorhus/pure
  #antigen theme robbyrussell
  #antigen theme denysdovhan/spaceship-prompt  
  
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

# set history file
# https://github.com/microsoft/vscode/issues/168396
HISTFILE="$HOME/.zsh_history"

# .profile
#source $HOME/.profile

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
