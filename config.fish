############################################
# ALIASES
############################################

# navigation
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# shortcuts
alias dt "cd ~/Desktop"
alias dl "cd ~/Downloads"
alias p "cd ~/Projects"
alias me "cd ~/Projects/benoitgrelard"
alias mz "cd ~/Projects/modulz"
alias wos "cd ~/Projects/workos"

# listings
alias l "ls -laF"

# git
alias gs "git status -s"
alias ga "git add"
alias gc "git commit"

# enable aliases to be sudo’ed
alias sudo "sudo "

# show/hide hidden files in Finder
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# show/hide desktop (useful when presenting)
alias showdesktop "defaults write com.apple.finder CreateDesktop -bool true; and killall Finder"
alias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"


############################################
# FUNCTIONS
############################################

# create a new directory and cd into it
function mkd
	mkdir -p $argv; and cd $argv
end

############################################
# OTHER
############################################

# volta (https://volta.sh/)
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
