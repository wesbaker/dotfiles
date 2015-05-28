#!/bin/sh

# Determine where we are and what the current directory is
if [[ $# -gt 0 ]]; then
	currentDir=$1
	if [[ -d "/var/www/"$1 ]]; then
		currentPath='/var/www/'$1
	elif [[ -d "/Users/wes/Sites/"$1 ]]; then
		currentPath='/Users/wes/Sites/'$1
	elif [[ -d "/Users/wes/Development/"$1 ]]; then
		currentPath='/Users/wes/Development/'$1
	fi
else
	currentPath=`pwd`
	currentDir=`basename $currentPath`
fi

# Check to see if you are specifying a suffix
if [[ $# -gt 1 ]]; then
	suffix="-"$2
fi

# Dump the mysql
# For this to work, the user @localhost (which is basically a wildcard) has to be enabled. Otherwise add sudo
mysqldump $currentDir > $currentPath"/"$currentDir$suffix".sql" --user='root'
