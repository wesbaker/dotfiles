# Abbreviations (like aliases, but better)
abbr -a -g l exa -lh
abbr -a -g c code
abbr -a -g gst git status
abbr -a -g v vim
abbr -a -g marked open -a 'Marked 2'

# Docker Abbreviations
abbr -a -g dcr docker container restart
abbr -a -g dcl docker container ls
abbr -a -g lz lazydocker

# Aliases
abbr -a -g icd cd ~/Library/Mobile\\ Documents/com~apple~CloudDocs

# Defaults
set -g -x EDITOR /usr/local/bin/vim

# chruby
source /usr/local/share/chruby/chruby.fish

# Directory Assistance
function cdd
	cd ~/Development/$argv[1]
end
complete -c cdd -a "(find ~/Development/* -type d -maxdepth 0 | sed 's/^.*Development\///')" -x

function t
	# Defaults to 3 levels deep, do more with `t 5` or `t 1`
	# pass additional args after
	if test -n "$argv[1]"
		set depth `eval $argv[1]`
	else
		set depth 3
	end

	tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L $depth -aC $2
end

# Colorized Man Pages
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")
