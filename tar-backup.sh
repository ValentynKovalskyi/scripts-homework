#!/bin/bash

DIST="~/backups/"
BACKUP_NAME="backup"
TIMESTAMP=$(date -u +%Y_%m_%d_%H_%M_%S)
FILES=()

handle_help() {
	echo "Usage: tar-backup [OPTIONS]" 
	echo "-h | --help	Print usage"
	echo "-f | --files	Specify target files"
	echo "-d | --dist	Specify distenation directory (default: ~/backups/)"
	echo "-n |--name	Specify backup name (default: backup)"
}

is_valid_argument() {
	[[ ( ! -z "$2" && "$2" != -*) ]]
}
 
handle_options() {
	while [[ $# -gt 0 ]]; do
		case $1 in
		-h | --help)
		handle_help
		exit 0
		;;
		-d | --dist)
		if ! is_valid_argument $@; then
			echo "Wrong dist argument, specify directory"
			handle_help
			exit 1
		fi
		DIST=$2
		shift
		;;
		-n | --name)
		if ! is_valid_argument $@; then
                        echo "Wrong name argument, specify backup name"
                        handle_help
                        exit 1
                fi
		BACKUP_NAME=$2
		shift
		;;
		-f | --files)
		if ! is_valid_argument $@; then
			echo "Must specify files or directories to backup with -f flag"
			handle_help
			exit 1
		fi
		local arr_index=0
		while is_valid_argument $@; do
			# Add test file check
			FILES[$arr_index]=$2
			((arr_index++))
			shift
		done
		;;
		*)
		echo "Invalid option: $1"
		handle_help
		exit 1
		;;
		esac
		shift
		done

}

handle_options $@
