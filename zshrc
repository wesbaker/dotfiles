# Load in homebrew autocomplete
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Load in homebrew
[[ -x /opt/homebrew/bin//brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# Load in Antigen
source /opt/homebrew/share/antigen/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Bundles from the default repo (robyrussell's oh-my-zsh)
antigen bundle command-not-found

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Tell antigen we're done
antigen apply

# Aliases
alias gst="git status"
alias l="ls -lh"
alias c="code"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=/Users/wesbaker/.fnm:$PATH
eval "`fnm env`"

