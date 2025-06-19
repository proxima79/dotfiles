# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/home/kenr/.dotnet/tools"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/kenr/.local/share/flatpak/exports/share
export AZURE_DEVOPS_EXT_PAT=Fvm2jttotwBNoupLIt4kjzqM3JTS5kjlmNXxRNgTk0maPUP1elL7JQQJ99BFACAAAAAyardJAAASAZDO1rjv

# Only override TERM when inside tmux
if [ -n "$TMUX" ]; then
  export TERM=screen-256color
fi

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autoload completion
autoload -Uz compinit
compinit

# Initialize fzf
if command -v fzf >/dev/null 2>&1; then
  # Auto-completion
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # Key bindings
  bindkey '^T' fzf-file-widget
  bindkey '^R' fzf-history-widget

  # Set default options
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!{.git,node_modules}/*"'
  export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --border --margin=0,1 --padding=0,1 --height=40% --bind=ctrl-d:half-page-down,ctrl-u:half-page-up'

  # Aliases
  alias fzf='fzf --layout=reverse --info=inline --border --margin=0,1 --padding=0,1 --height=40%'
  alias fzf-history='fzf --layout=reverse --info=inline --border --margin=0,1 --padding=0,1 --height=40% --bind=ctrl-d:half-page-down,ctrl-u:half-page-up'
fi

# Custom cd function using fzf
cdf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias cat='bat'

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

# Catppuccin Mocha theme for terminal
source ~/.config/catppuccin/mocha.sh
source ~/.config/catppuccin/fzf.sh

# Enable Starship prompt
eval "$(starship init zsh)"
