# General conf
export PROJECTS_DIR=$HOME/projects
export PATH="/Applications/MAMP/bin/php/php7.4.21/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/bin"
export EDITOR="vim"
#BASH
#export PS1='\u@\H:\w$ '
# CREDENTIALS
[ -f "$HOME/.profile_credentials" ] && source $HOME/.profile_credentials || echo "warning, .profile_credentials with secure credentials not found"
# BREW
if which brew &> /dev/null; then
  export PATH="/usr/local/sbin:$PATH"
fi
# ibrew for x86 version
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'
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
#GITHUB
export CR_PAT=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
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
#GO
#https://ahmadawais.com/install-go-lang-on-macos-with-homebrew/
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
#COMPOSER
alias composer="php /usr/local/bin/composer.phar"
export COMPOSER_MEMORY_LIMIT=-1 
#TABTAB
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
#[[ -f /Users/magnum/.nvm/versions/node/v10.1.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.$
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
#[[ -f /Users/magnum/.nvm/versions/node/v10.1.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] $
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
#SDKMAN
export SDKMAN_DIR="/Users/magnum/.sdkman"
[[ -s "/Users/magnum/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/magnum/.sdkman/bin/sdkman-init.sh"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/magnum/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/magnum/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/magnum/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/magnum/google-cloud-sdk/completion.zsh.inc'; fi
#PCSC
export PATH="/usr/local/opt/pcsc-lite/bin:$PATH"
export PATH="/usr/local/opt/pcsc-lite/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/pcsc-lite/lib"
export CPPFLAGS="-I/usr/local/opt/pcsc-lite/include"
export PKG_CONFIG_PATH="/usr/local/opt/pcsc-lite/lib/pkgconfig"

#RVM
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#RBENV
eval "$(rbenv init -)"
#UTILS
macnst (){
    netstat -Watnlv | grep LISTEN | awk '{"ps -o comm= -p " $9 | getline procname;colred="\033[01;31m";colclr="\033[0m"; print colred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname;  }' | column -t -s "|"
}
#echo '.profile parsed'

#MAMP
#MAMP_PHP_VERSION=php5.4.45
MAMP_PHP_VERSION=php8.0.8
MAMP_PHP_DIR=/Applications/MAMP/bin/php/$MAMP_PHP_VERSION
export PATH=${MAMP_PHP_DIR}/bin:$PATH
alias php='$MAMP_PHP_DIR/bin/php -c "/Library/Application Support/appsolute/MAMP PRO/conf/$MAMP_PHP_VERSION.ini"'
alias php-config='$MAMP_PHP_DIR/bin/php-config'
alias phpdbg='$MAMP_PHP_DIR/bin/phpdbg'
alias phpize='$MAMP_PHP_DIR/bin/phpize'
alias pear='$MAMP_PHP_DIR/bin/pear'
alias peardev='$MAMP_PHP_DIR/bin/peardev'
alias pecl='$MAMP_PHP_DIR/bin/pecl'
