# ~/.config/fish/config.fish
# Path to your oh-my-fish.
# Install oh-my-fish first!
# curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme toaster

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme git-flow rails gem rvm ssh sublime tmux vundle brew localhost osx tab balias

set EDITOR vim

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

function l
  ls -lah $argv
end

function m
  git add . -A
  git commit -m $argv
end

function wow
  git status
end

function fuck
  eval (thefuck $history[1])
end

function c
  clear
end

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

