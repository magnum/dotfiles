# General conf
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/bin"
export EDITOR="vim"
export GIT_EDITOR=vim


# CREDENTIALS
[ -f "$HOME/.profile_credentials" ] && source $HOME/.profile_credentials || echo "warning, .profile_credentials with secure credentials not found"


# Rbenv
if which rbenv &> /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi


# BREW
if which brew &> /dev/null; then
  export PATH="/usr/local/sbin:$PATH"
fi


# PYTHON
export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_BIN_PATH"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh


# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)


# AMAZON EC2
export EC2_HOME=$HOME/bin/ec2-api-tools
export EC2_URL=https://ec2.eu-west-1.amazonaws.com


# NODE
export PATH=/usr/local/share/npm/bin:$PATH
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm
if which yarn &> /dev/null; then
  export PATH="$PATH:$HOME/.yarn/bin"
fi


# TRANSFER
#transfer() {
#    # write to output to tmpfile because of progress bar
#    tmpfile=$( mktemp -t transferXXX )
#    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
#    cat $tmpfile;
#    rm -f $tmpfile;
#}
#alias transfer=transfer


# GIT
export GIT_CEILING_DIRECTORIES='/Users/magnum'


# TMUX
alias tmux="TERM=screen-256color-bce tmux"
export DISABLE_AUTO_TITLE="true"



# ANDROID
ANDROID_HOME=/Users/magnum/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools


# APPLE 
#export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer  
export DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer

# OTHER
alias pop="osascript -e 'display notification \"Done\" with title \"CLI\"'"


# GCLOUD
source $HOME/google-cloud-sdk/completion.zsh.inc
source $HOME/google-cloud-sdk/path.zsh.inc

