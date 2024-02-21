# Created by newuser for 5.8

# Load promt themes
autoload -Uz promptinit
promptinit

# Allow colors in prompt
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b|%m%u%c) '

precmd() { vcs_info }

checkssh() {
  if [ -n "$SSH_CLIENT" ]; then
    echo "SSH "
  fi
}

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}$(checkssh)%f%b%n@%U%B%{$fg[yellow]%}%M%b%u %{$fg[blue]%}%3~ %B%{$fg[magenta]%}${vcs_info_msg_0_}%f%b%(?.%{$fg[cyan]%}%#%f.%{$fg[red]%}%#%f) '

RPROMPT='%(?..%{$fg[red]%}[%?]%f)'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select 
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

alias ls="ls --color"
alias la="ls -lha --color"

alias cht="$HOME/.local/bin/cht/cht.sh"

# zsh syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
