# -----------------------------------------------------------------
# Functions
# -----------------------------------------------------------------

message() {
  printf "$*\n"
}

ok() {
  printf "...done\n\n"
}

brew_clean() {
  brew update && brew upgrade && brew cleanup && brew cask cleanup
}


# -----------------------------------------------------------------
# Check dest dir is provided
# -----------------------------------------------------------------
if [ -z "$1" ]; then
  echo "please provide dest dir, ie. 'install.sh ~' OR 'install.sh \$HOME' OR 'install.sh ./test'";
  exit
else
  dest=$1
  mkdir -p $dest #creating dest dir if not exists
  echo "symlinking dotfiles in '$1'";
fi

# -----------------------------------------------------------------
# Variables
# -----------------------------------------------------------------

dir=$(pwd)
now=`date +%Y-%m-%d-%H:%M:%S`


# -----------------------------------------------------------------
# Create symlink and create files in homedir from .dotfiles folder
# -----------------------------------------------------------------

file_paths=$dir/*
file_name_excluded="settings Brewfile install.sh"
message "Remove old files and create new files symlinked..."
for file_path in $file_paths
do
  file_name="${file_path##*/}"  # get filename
  if ! [[ $file_name_excluded =~ $file_name ]]; then # check path is not excluded
    echo "Processing $file_name"
    rm -rf $dest/.$file_name
    ln -s $file_path $dest/.$file_name
  fi
done
ok


# -----------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------

# Install Homebrew
if type "brew" > /dev/null; then
  message "Homebrew found. Let's Go!"
else
  message "Homebrew not found. Installing..."
  echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"`"
  ok
fi


# Install Brew bundle
if printf "brew bundle"  > /dev/null; then
  message "Brew bundle found."
  brew bundle
  brew_clean
else
  message "Homebrew not found. Installing..."
  brew tap Homebrew/bundle
  brew bundle
  brew_clean
fi
ok


# -----------------------------------------------------------------
# npm packages
# -----------------------------------------------------------------

if type "npm" > /dev/null; then
    message "Installing npm packages..."
    npm install --global gulp
    npm install --global bower
    npm install --global speed-test
    npm install --global nodemon
    ok
fi


# -----------------------------------------------------------------
# Install Ruby gems
# -----------------------------------------------------------------

if type "rbenv" > /dev/null; then
    message "Installing Ruby with rbenv..."
    # change ruby version if you want
    rbenv install 2.0.0-p645 && rbenv local 2.0.0-p645 && rbenv rehash
    # install gems
    gem install sass
    gem install jekyll
    ok
fi

 gem install tmuxinator


# -----------------------------------------------------------------
# Install Pow
# -----------------------------------------------------------------

if [ ! -d "$dest/.pow" ]; then
  message "Installing Pow..."
  curl get.pow.cx | sh
fi


# -----------------------------------------------------------------
# Shell
# -----------------------------------------------------------------

# Set Zsh as Default shell
if [[ ! `echo $SHELL` == "/bin/zsh" ]]; then
  message "Set Zsh as default shell..."
  chsh -s /bin/zsh
  ok
fi

# Install Oh my zsh if doesn't exist
if [ ! -d "$dest/.oh-my-zsh" ]; then
  message "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ok
fi


# -----------------------------------------------------------------
# Settings and credentials
# -----------------------------------------------------------------
ln -s $HOME/settings/ssh $HOME/.ssh
ln -s $HOME/settings/profile_credentials $HOME/.profile_credentials

ln -s $HOME/settings/transmit_Favorites ~/Library/Application\ Support/Transmit/Favorites
ln -s $HOME/settings/sequelpro_Favorites.plist ~/Library/Application\ Support/Sequel\ Pro/Data/Favorites.plist

ln -s $HOME/settings/magnum.zsh-theme $HOME/.oh-my-zsh/themes/magnum.zsh-theme
