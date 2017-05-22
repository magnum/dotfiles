# Antigen
source "$HOME/antigen.zsh"

# General conf
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/bin"
export EDITOR="vim"
export GIT_EDITOR=vim

if which antigen &> /dev/null; then
  antigen use oh-my-zsh
  antigen bundle git
  antigen bundle heroku
  antigen bundle command-not-found
  antigen bundle zsh-users/zsh-autosuggestions
  antigen theme mgee/slimline
  antigen apply
fi

# Zsh files
export "DOTS=$HOME/dotfiles"
for file in $DOTS/**/*.zsh; do
  source "$file";
done

# Rbenv
if which rbenv &> /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Yarn
if which yarn &> /dev/null; then
  export PATH="$PATH:$HOME/.yarn/bin"
fi

# Brew
if which brew &> /dev/null; then
  export PATH="/usr/local/sbin:$PATH"
fi
