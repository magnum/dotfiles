# PATHS
export PATH=/usr/local/bin:/usr/bin:/Users/magnum/bin:/usr/local/mysql/bin:/usr/local/nginx/sbin:$PATH
export PATH="/usr/local/sbin:$PATH" 

# PYTHON
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#export PIP_VIRTUALENV_BASE=$WORKON_HOME
#export PIP_RESPECT_VIRTUALENV=true
#source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)

# PHP
#export PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

# AMAZON EC2
export EC2_HOME=$HOME/bin/ec2-api-tools
export EC2_URL=https://ec2.eu-west-1.amazonaws.com

# AMAZON BEANSTALK
export PATH=$PATH:$HOME/bin/AWS-ElasticBeanstalk-CLI-2.6.0/eb/linux/python2.7

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


# NODE, NVM
export PATH=/usr/local/share/npm/bin:$PATH
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm

# PEBBLE 
export PATH=~/pebble-dev/arm-cs-tools/bin:$PATH


# CREDENTIALS
[ -f "$HOME/.profile_credentials" ] && source $HOME/.profile_credentials || echo "warning, .profile_credentials with secure credentials not found" 


# PACKER
export PATH=/usr/local/packer:$PATH


# TRANSFER
transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}

alias transfer=transfer


# GIT
export GIT_CEILING_DIRECTORIES='/Users/magnum'

# ALIASES
alias nginx.start='sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.stop='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias nginx.restart='nginx.stop && nginx.start'
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php55.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php55.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.restart='mysql.stop && mysql.start'
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
alias nginx.logs.phpmyadmin.error='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.error.log'
alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'

alias tmux="TERM=screen-256color-bce tmux"

# SCALA
PATH=$PATH:~/bin
