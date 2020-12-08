
# General conf
export PROJECTS_DIR=$HOME/projects
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/bin"
export EDITOR="vim"
#BASH
export PS1='\u@\H:\w$ '
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
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)
# AMAZON AWS
export EC2_HOME=$HOME/bin/ec2-api-tools
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# TRANSFER
#transfer() {
#    # write to output to tmpfile because of progress bar
#    tmpfile=$( mktemp -t transferXXX )
#    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
#    cat $tmpfile;
#    rm -f $tmpfile;
#}
# GIT
export GIT_CEILING_DIRECTORIES='/Users/magnum'
export GIT_EDITOR=vim
# TMUX
alias tmux="TERM=screen-256color-bce tmux"
export DISABLE_AUTO_TITLE="true"
# ANDROID
export ANDROID_HOME=/Users/magnum/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/magnum/Library/Android/sdk
export PATH=${PATH}:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools
# APPLE 
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer  
#export DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer
# OTHER
alias pop="osascript -e 'display notification \"Done\" with title \"CLI\"'"
# GCLOUD
if [ -n "$ZSH_VERSION" ]; then # assume Zsh
  source $HOME/google-cloud-sdk/completion.zsh.inc
  source $HOME/google-cloud-sdk/path.zsh.inc
fi
# SQLITE w/ brew
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
#CORDOVA
#export CORDOVA_ANDROID_GRADLE_DISTRIBUTION_URL="https\\://services.gradle.org/distributions/gradle-4.6-all.zip"
#DOTNET
#ln -s /usr/local/share/dotnet/dotnet /usr/local/bin
export PATH=/usr/local/share/dotnet:$PATH
#Intel OpenVINO
source /opt/intel/openvino/bin/setupvars.sh >/dev/null 2>&1
#HYPERLEDGER
export PATH=$PATH:$PROJECTS_DIR/fabric-samples/bin/
#GO
#https://ahmadawais.com/install-go-lang-on-macos-with-homebrew/
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/magnum/.sdkman"
[[ -s "/Users/magnum/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/magnum/.sdkman/bin/sdkman-init.sh"
#echo ".profile parsed"
#COMPOSER
alias composer="php /usr/local/bin/composer.phar"
export COMPOSER_MEMORY_LIMIT=-1 
#ALIASES
alias php='/Applications/MAMP/bin/php/php7.3.21/bin/php -c "/Library/Application Support/appsolute/MAMP PRO/conf/php7.3.21.ini"'
alias pear='/Applications/MAMP/bin/php/php7.3.21/bin/pear'
alias pecl='/Applications/MAMP/bin/php/php7.3.21/bin/pecl'
