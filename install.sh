#!/usr/bin/env bash

############################################
# HOMEBREW
############################################

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# make sure we’re using the latest homebrew
brew update

# upgrade any already-installed formulae
brew upgrade

# install basics stuff
brew install fish
brew install git

# install other useful things
brew install tree
brew install watchman # to fix jest watch mode
brew install yarn

# enable installing alternate app versions using cask
brew tap homebrew/cask-versions

# enable installing drivers using cask
brew tap homebrew/cask-drivers

# install apps
brew install --cask 1password
brew install --cask appzapper
brew install --cask browserosaurus
brew install --cask discord
brew install --cask firefox
brew install --cask github
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask raycast
brew install --cask slack
brew install --cask the-unarchiver
brew install --cask visual-studio-code
brew install --cask zoom

# install drivers
brew install --cask logitech-options

# install quicklook plugins
brew install --cask qlcolorcode # syntax highlighting
brew install --cask qlstephen # extension-less text files
brew install --cask qlmarkdown
brew install --cask quicklook-json
brew install --cask quicklook-csv

# remove outdated versions from the cellar
brew cleanup


############################################
# CONFIG
############################################

# add fish to the list of acceptable shells (if not already present)
grep -q /opt/homebrew/bin/fish /etc/shells
if [ $? -ne 0 ]; then
	echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
fi

# change current shell to fish
chsh -s /opt/homebrew/bin/fish

# install fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# install z
fisher install jethrokuan/z

# install fish-nvm
fisher install jorgebucaran/fish-nvm

# install dracula iterm theme
mkdir -p ~/.config/iterm
curl https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors > ~/.config/iterm/Dracula.itermcolors
open ~/.config/iterm/Dracula.itermcolors

# install dracula fish color mapping
curl https://raw.githubusercontent.com/dracula/fish/master/conf.d/dracula.fish > ~/.config/fish/conf.d/dracula.fish

# finally symlink everything
ln -fs "$(pwd)/.editorconfig" ~/.editorconfig
ln -fs "$(pwd)/.gitconfig" ~/.gitconfig
ln -fs "$(pwd)/.gitignore" ~/.gitignore
ln -fs "$(pwd)/.hushlogin" ~/.hushlogin
ln -fs "$(pwd)/config.fish" ~/.config/fish/config.fish
ln -fs "$(pwd)/fish_prompt.fish" ~/.config/fish/functions/fish_prompt.fish
ln -fs "$(pwd)/fish_title.fish" ~/.config/fish/functions/fish_title.fish
ln -fs "$(pwd)/fish_greeting.fish" ~/.config/fish/functions/fish_greeting.fish
