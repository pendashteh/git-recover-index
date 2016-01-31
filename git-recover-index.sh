#!/bin/bash
set -e

main () {
	root=$(pwd)
	script_root=$(_get_script_root)
	# @TODO use variable in the python script

	_git_recover_index_tmpfile=$root/.git-lost-commits
	_git_recover_index_recover_path=$root/git-recovered
	# get list of all lost commits
	git fsck --cache --unreachable $(git for-each-ref --format="%(objectname)") | tr -s " " | cut -d " " -f 3 > $_git_recover_index_tmpfile

	if [ ! -s "$_git_recover_index_tmpfile" ]
		then
		echo "No lost commit found. Hope it is the desired!"
		rm -f $_git_recover_index_tmpfile
		exit
	fi
q	_count=$(wc -l < $_git_recover_index_tmpfile)
	mkdir -p $_git_recover_index_recover_path
	echo "$_count lost commit found. Processing..."
	_git_recover_commits
	rm $_git_recover_index_tmpfile
	echo "Done."
	echo "Find recovered commits at "$_git_recover_index_recover_path
}

_get_script_root() {
	# Helper functions to get the abolute path for the command
	# Copyright http://stackoverflow.com/a/7400673/257479
	myreadlink() { [ ! -h "$1" ] && echo "$1" || (local link="$(expr "$(command ls -ld -- "$1")" : '.*-> \(.*\)$')"; cd $(dirname $1); myreadlink "$link" | sed "s|^\([^/].*\)\$|$(dirname $1)/\1|"); }
	whereis() { echo $1 | sed "s|^\([^/].*/.*\)|$(pwd)/\1|;s|^\([^/]*\)$|$(which -- $1)|;s|^$|$1|"; }
	whereis_realpath() { local SCRIPT_PATH=$(whereis $1); myreadlink ${SCRIPT_PATH} | sed "s|^\([^/].*\)\$|$(dirname ${SCRIPT_PATH})/\1|"; }
	echo $(dirname $(whereis_realpath "$0"))
}

_git_recover_commits() {
	export _git_recover_index_tmpfile
	export _git_recover_index_recover_path
	python $script_root/recover-commits.py
	# @TODO embed the extra file
	# python <<< END
	#	...
	# END
}

main
