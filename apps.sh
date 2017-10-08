#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  1password
  appcleaner
  visual-studio-code
  dropbox
  google-chrome
  vlc
  spotify
)


# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # link with alfred
  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

alfred() {
  brew cask alfred link
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
