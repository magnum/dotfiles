
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="ys"
ZSH_THEME="magnum"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rake='noglob rake'
alias rake='noglob bundle exec rake'
alias bower='noglob bower'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate rbenv ruby lighthouse)
plugins=(history history-substring-search git git-extras heroku osx ruby rails rubyenv gem django node npm nvm brew sublime)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...



#http://juergenbusam.com/development/tmux-rbenv-and-zsh-on-osx/
# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

# if rbenv is present, configure it for use
if which rbenv &> /dev/null; then
  # Put the rbenv entry at the front of the line
  export PATH="$HOME/.rbenv/bin:$PATH"

  # enable shims and auto-completion
  eval "$(rbenv init -)"
fi
