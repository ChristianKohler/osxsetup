#
# Binary installer
#

# chaning permission for homebrew to /usr/local
sudo chown -R $(whoami):admin /usr/local

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install other useful binaries
binaries=(
  grep
  git
  node
)

# Install the binaries
brew install ${binaries[@]}

# Add osx specific command line tools
if test ! $(which subl); then
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

# Install spot
if test ! $(which spot); then
  curl -L https://raw.github.com/guille/spot/master/spot.sh -o /usr/local/bin/spot && chmod +x /usr/local/bin/spot
fi

# Remove outdated versions from the cellar
brew cleanup

exit 0
