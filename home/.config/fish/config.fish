# rbenv
set -gx RBENV_ROOT /usr/local/var/rbenv

# Disable Fish Greeting
set fish_greeting

# Default editor is vim
set -g -x EDITOR vim

# PATH Variables
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set php_path (brew --prefix php56)/bin
set node_path /usr/local/lib/noded
set brew_rbenv "/usr/local/var/rbenv/shims"
set -gx PATH $brew_rbenv $homebrew $brew_rbenv $php_path $node_path $default_path

# Homebrew
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Database tools
alias db.import "sh ~/.bin/dbimport.sh"
complete -c db.import -a "(mysql -u root -E -e 'SHOW databases;' | sed -n 's/Database: \(.*\)/\1/p')" -x
alias db.backup-all "mysqldump --user=root --all-databases --add-drop-table > ~/Development/mysql-dump.sql"
alias db.import-all "mysql --user=root < ~/Development/mysql-dump.sql"
alias db.backup "sh ~/.bin/dbbackup.sh"
complete -c db.backup -a "(mysql -u root -E -e 'SHOW databases;' | sed -n 's/Database: \(.*\)/\1/p')" -x

# Terminal Utilities
alias l "ls -lhp"
alias fc "dscacheutil -flushcache"

# Utilities
alias boom='nocorrect boom'
alias git=hub
alias phing.install "rm -f /usr/local/Cellar/php56/*/lib/php/.lock; pear channel-discover pear.phing.info; pear install phing/phing; ~/Development/internal-tools/phing_tasks/install"

# Directory Assistance
function cdd
	cd ~/Development/$argv[1]
end
complete -c cdd -a "(find ~/Development/* -type d -maxdepth 0 | sed 's/^.*Development\///')" -x

function cds
	cd ~/Sites/$argv[1]
end
complete -c cds -a "(find ~/Sites/* -type d -maxdepth 0 | sed 's/^.*Sites\///')" -x

# Git Stuff
alias gst "git status"
alias ggpull 'git pull origin (git rev-parse --abbrev-ref HEAD)'
alias ggpush 'git push origin (git rev-parse --abbrev-ref HEAD)'
alias ggpnp 'git pull origin (git rev-parse --abbrev-ref HEAD); and git push origin (git rev-parse --abbrev-ref HEAD)'

# Percona
alias percona.start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist"
alias percona.stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.percona-server.plist"
alias percona.restart 'percona.stop; percona.start'

# Memcached
alias memcached.start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached.stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached.restart 'memcached.stop; memcached.start'

# Redis
alias redis.start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis.stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis.restart "redis.stop; redis.start"
