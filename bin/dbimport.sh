#!/bin/sh

# Check for flags
while [[ $# -gt 0 ]];
do
	case "$1" in
		-d)
			delete=true;;
		*)
			break;;
	esac
	shift
done

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

# If delete flag is set, drop db
if [[ $delete == true ]]; then
	mysqladmin -u root drop $currentDir
	mysqladmin -u root create $currentDir
fi

# Import the Database Dump
mysql --user='root' $currentDir < $currentPath"/"$currentDir$suffix".sql"
